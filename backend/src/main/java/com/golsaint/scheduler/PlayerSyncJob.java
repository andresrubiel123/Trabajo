package com.golsaint.scheduler;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.stereotype.Component;

import com.golsaint.integration.sportsdb.service.SportsDbService;
import com.golsaint.modules.equipo.entity.Equipo;
import com.golsaint.modules.jugador.entity.Jugador;
import com.golsaint.modules.jugador.repository.JugadorRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * Job para sincronizar plantillas de jugadores de un equipo desde TheSportsDB.
 */
/**
 * Tarea programada para sincronizar datos de PlayerSync.
 *
 * @author Rubiel Andrés Díaz
 */

@Slf4j
@Component
@RequiredArgsConstructor
public class PlayerSyncJob {

    private final SportsDbService sportsDbService;
    private final JugadorRepository jugadorRepository;

    public void syncPlayersForTeam(Equipo equipo) {
        try {
            // Pausa corta para respetar los límites de la API gratuita (rate limits)
            Thread.sleep(1000);
            Map<String, Object> playersData = sportsDbService.getPlayersByTeam(equipo.getNombre()).block();
            if (playersData != null && playersData.get("player") instanceof List playersList) {
                log.info("Importando {} jugadores para el equipo: {}", playersList.size(), equipo.getNombre());
                Random rng = new Random();
                for (Object obj : playersList) {
                    if (!(obj instanceof Map playerMap)) continue;
                    String name = (String) playerMap.get("strPlayer");
                    if (name == null) continue;

                    boolean exists = jugadorRepository.findByEquipoId(equipo.getId()).stream()
                            .anyMatch(j -> j.getNombre().equalsIgnoreCase(name));
                    
                    if (!exists) {
                        Jugador jugador = Jugador.builder()
                                .nombre(name)
                                .edad(18 + rng.nextInt(20))
                                .equipo(equipo)
                                .velocidad(55 + rng.nextInt(40))
                                .definicion(55 + rng.nextInt(40))
                                .pase(55 + rng.nextInt(40))
                                .regate(55 + rng.nextInt(40))
                                .defensa(55 + rng.nextInt(40))
                                .fisico(55 + rng.nextInt(40))
                                .ratingGeneral(65 + rng.nextInt(30))
                                .build();
                        jugadorRepository.save(jugador);
                    }
                }
            }
        } catch (InterruptedException ie) {
            Thread.currentThread().interrupt();
            log.warn("Sincronización interrumpida al buscar jugadores del equipo: {}", equipo.getNombre());
        } catch (Exception e) {
            log.warn("No se pudieron importar jugadores para {}: {}", equipo.getNombre(), e.getMessage());
        }
    }

    /**
     * Retorna la cantidad de jugadores asociados al equipo con el id dado.
     * Usado por SyncController para decidir si hay que sincronizar.
     */
    public long countJugadoresByEquipo(Long equipoId) {
        return jugadorRepository.findByEquipoId(equipoId).size();
    }
}
