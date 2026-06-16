package com.golsaint.scheduler;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.scheduling.annotation.Scheduled;

import com.golsaint.integration.sportsdb.service.SportsDbService;
import com.golsaint.modules.equipo.entity.Equipo;
import com.golsaint.modules.equipo.repository.EquipoRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * Job para sincronizar y enriquecer información de equipos desde TheSportsDB.
 */
/**
 * Tarea programada para sincronizar datos de TeamSync.
 *
 * @author Rubiel Andrés Díaz
 */

@Slf4j
@Component
@RequiredArgsConstructor
public class TeamSyncJob {

    private final SportsDbService sportsDbService;
    private final EquipoRepository equipoRepository;
    private final PlayerSyncJob playerSyncJob;

    public Equipo getOrCreateEquipo(String nombre, String defaultCrestUrl) {
        return equipoRepository.findByNombre(nombre).orElseGet(() -> {
            log.info("Nuevo equipo detectado: {}. Buscando multimedia en TheSportsDB...", nombre);
            String badgeUrl = defaultCrestUrl; // Usar el escudo de Football-Data como fallback inicial
            String country = "Desconocido";

            try {
                Map<String, Object> details = sportsDbService.searchTeam(nombre).block();
                if (details != null && details.get("teams") instanceof List<?> teamList && !teamList.isEmpty()) {
                    @SuppressWarnings("unchecked")
                    Map<String, Object> teamInfo = (Map<String, Object>) teamList.get(0);
                    String sportsDbBadge = (String) teamInfo.get("strTeamBadge");
                    if (sportsDbBadge != null && !sportsDbBadge.isEmpty()) {
                        badgeUrl = sportsDbBadge;
                    }
                    country = (String) teamInfo.getOrDefault("strCountry", "Desconocido");
                    log.info("Escudo obtenido para {} desde TheSportsDB: {}", nombre, sportsDbBadge != null ? "✓" : "No disponible (usando fallback)");
                }
            } catch (Exception e) {
                log.warn("No se pudo obtener el escudo de {} desde TheSportsDB: {}. Usando fallback.", nombre, e.getMessage());
            }

            Equipo nuevoEquipo = Equipo.builder()
                    .nombre(nombre)
                    .pais(country)
                    .escudoUrl(badgeUrl)
                    .ratingGeneral(75)
                    .build();
            
            nuevoEquipo = equipoRepository.save(nuevoEquipo);

            // Sincronizar jugadores para este nuevo equipo
            playerSyncJob.syncPlayersForTeam(nuevoEquipo);

            return nuevoEquipo;
        });
    }

    @Scheduled(cron = "0 0 9,21 * * *")
    public void healMissingLogos() {
        log.info("====== GOL SAINT: Iniciando reparación de escudos faltantes ======");
        List<Equipo> equiposSinEscudo = equipoRepository.findAll().stream()
                .filter(e -> e.getEscudoUrl() == null || e.getEscudoUrl().trim().isEmpty())
                .toList();

        if (equiposSinEscudo.isEmpty()) {
            log.info("No hay equipos con escudos faltantes.");
            return;
        }

        log.info("Se encontraron {} equipos sin escudo. Iniciando recuperación...", equiposSinEscudo.size());
        for (Equipo equipo : equiposSinEscudo) {
            try {
                Map<String, Object> details = sportsDbService.searchTeam(equipo.getNombre()).block();
                if (details != null && details.get("teams") instanceof List<?> teamList && !teamList.isEmpty()) {
                    @SuppressWarnings("unchecked")
                    Map<String, Object> teamInfo = (Map<String, Object>) teamList.get(0);
                    String badgeUrl = (String) teamInfo.get("strTeamBadge");
                    if (badgeUrl != null && !badgeUrl.trim().isEmpty()) {
                        equipo.setEscudoUrl(badgeUrl);
                        equipoRepository.save(equipo);
                        log.info("Escudo recuperado para {}: {}", equipo.getNombre(), badgeUrl);
                    }
                }
                Thread.sleep(3000); // Pausa para no saturar TheSportsDB (30 req/min)
            } catch (InterruptedException ie) {
                Thread.currentThread().interrupt();
                break;
            } catch (Exception ex) {
                log.warn("Error recuperando escudo para {}: {}", equipo.getNombre(), ex.getMessage());
            }
        }
        log.info("====== GOL SAINT: Reparación de escudos completada ======");
    }
}
