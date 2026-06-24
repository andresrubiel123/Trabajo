package com.golsaint.scheduler;

import com.golsaint.config.ApiConfig;
import com.golsaint.integration.footballdata.service.FootballDataService;
import com.golsaint.modules.competicion.entity.Competicion;
import com.golsaint.modules.equipo.entity.Equipo;
import com.golsaint.modules.partido.entity.Partido;
import com.golsaint.modules.partido.repository.PartidoRepository;
import com.golsaint.modules.estadistica_partido.entity.EstadisticaPartido;
import com.golsaint.modules.estadistica_partido.repository.EstadisticaPartidoRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

/**
 * Job principal que coordina la sincronización de partidos y estadísticas con APIs externas.
 */
/**
 * Tarea programada para sincronizar datos de MatchSync.
 *
 * @author Rubiel Andrés Díaz
 */

@Slf4j
@Component
@RequiredArgsConstructor
public class MatchSyncJob {

    private final FootballDataService footballDataService;
    private final ApiConfig apiConfig;
    private final CompetitionSyncJob competitionSyncJob;
    private final TeamSyncJob teamSyncJob;
    private final PartidoRepository partidoRepository;
    private final EstadisticaPartidoRepository estadisticaPartidoRepository;

    

    @Scheduled(cron = "0 0 */2 * * *")
    @Transactional
    public void runSync() {
        log.info("====== GOL SAINT: Iniciando sincronización de datos de partidos ======");
        
        List<ApiConfig.FootballData.Competicion> competitions = apiConfig.getFootballdata().getCompetitions();
        if (competitions == null || competitions.isEmpty()) {
            log.warn("No hay competiciones configuradas en application.yml");
            return;
        }

        for (ApiConfig.FootballData.Competicion comp : competitions) {
            log.info("Sincronizando competición: {} ({})", comp.getNombre(), comp.getCode());
            try {
                syncCompetition(comp);
                Thread.sleep(6000); // Pausa de 6 segundos para evitar HTTP 429
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                log.error("Sincronización interrumpida en: {}", comp.getCode());
                break;
            } catch (Exception e) {
                log.error("Error sincronizando {}: {}", comp.getCode(), e.getMessage());
            }
        }
        
        log.info("====== GOL SAINT: Sincronización completada exitosamente ======");
    }

    /**
     * Permite sincronizar una competición individual desde el SyncController.
     */
    public void syncCompeticionPublic(ApiConfig.FootballData.Competicion comp) {
        log.info("====== Sincronizando competición individual: {} ======", comp.getNombre());
        try {
            syncCompetition(comp);
        } catch (Exception e) {
            log.error("Error sincronizando {}: {}", comp.getCode(), e.getMessage());
        }
        log.info("====== Sync de {} completado ======", comp.getNombre());
    }

    private void syncCompetition(ApiConfig.FootballData.Competicion comp) {
        Map<String, Object> rawData = footballDataService.getMatchesByCompetition(comp.getCode()).block();
        if (rawData == null || !rawData.containsKey("matches")) {
            log.warn("Sin datos para la competición: {}", comp.getCode());
            return;
        }

        String emblemUrl = null;
        if (rawData.get("competition") instanceof Map<?, ?> compMap) {
            emblemUrl = (String) compMap.get("emblem");
        }
        if ((emblemUrl == null || emblemUrl.trim().isEmpty()) && rawData.get("area") instanceof Map<?, ?> areaMap) {
            emblemUrl = (String) areaMap.get("flag");
        }

        Competicion competicion = competitionSyncJob.getOrCreateCompeticion(comp, emblemUrl);
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> matches = (List<Map<String, Object>>) rawData.get("matches");
        log.info("Partidos encontrados en {}: {}", comp.getNombre(), matches.size());

        for (Map<String, Object> matchMap : matches) {
            try {
                processMatch(matchMap, competicion);
            } catch (Exception e) {
                log.error("Error procesando partido: {}", e.getMessage());
            }
        }
    }

    private void processMatch(Map<String, Object> matchMap, Competicion competicion) {
        Number matchIdNum = (Number) matchMap.get("id");
        if (matchIdNum == null) return;
        Long matchId = matchIdNum.longValue();

        @SuppressWarnings("unchecked")
        Map<String, Object> homeTeamMap = (Map<String, Object>) matchMap.get("homeTeam");
        @SuppressWarnings("unchecked")
        Map<String, Object> awayTeamMap = (Map<String, Object>) matchMap.get("awayTeam");
        if (homeTeamMap == null || awayTeamMap == null) return;

        String homeTeamName = (String) homeTeamMap.get("name");
        String awayTeamName = (String) awayTeamMap.get("name");
        if (homeTeamName == null || awayTeamName == null) return;

        String homeCrest = (String) homeTeamMap.get("crest");
        String awayCrest = (String) awayTeamMap.get("crest");

        Equipo homeTeam = teamSyncJob.getOrCreateEquipo(homeTeamName, homeCrest);
        Equipo awayTeam = teamSyncJob.getOrCreateEquipo(awayTeamName, awayCrest);

        String status = (String) matchMap.get("status");
        String utcDateStr = (String) matchMap.get("utcDate");
        OffsetDateTime matchDate = OffsetDateTime.parse(utcDateStr, DateTimeFormatter.ISO_OFFSET_DATE_TIME);

        Integer goalsHome = null;
        Integer goalsAway = null;
        String winner = null;
        @SuppressWarnings("unchecked")
        Map<String, Object> scoreMap = (Map<String, Object>) matchMap.get("score");
        if (scoreMap != null) {
            winner = (String) scoreMap.get("winner");
            @SuppressWarnings("unchecked")
            Map<String, Object> fullTimeMap = (Map<String, Object>) scoreMap.get("fullTime");
            if (fullTimeMap != null) {
                Number homeGoalsNum = (Number) fullTimeMap.get("home");
                Number awayGoalsNum = (Number) fullTimeMap.get("away");
                if (homeGoalsNum != null) goalsHome = homeGoalsNum.intValue();
                if (awayGoalsNum != null) goalsAway = awayGoalsNum.intValue();
            }
        }

        Partido partido = Partido.builder()
                .id(matchId)
                .equipoLocal(homeTeam)
                .equipoVisitante(awayTeam)
                .fecha(matchDate)
                .competicion(competicion)
                .estado(status)
                .golesLocal(goalsHome)
                .golesVisitante(goalsAway)
                .ganador(winner)
                .build();

        partido = partidoRepository.save(partido);

        if (estadisticaPartidoRepository.findByPartidoId(partido.getId()).isEmpty()) {
            EstadisticaPartido stats = EstadisticaPartido.builder()
                    .partido(partido)
                    .posesionLocal(50)
                    .posesionVisitante(50)
                    .tirosLocal(0)
                    .tirosVisitante(0)
                    .corners(0)
                    .build();
            estadisticaPartidoRepository.save(stats);
        }
    }
}
