package com.golsaint.scheduler;

import com.golsaint.config.ApiConfig;
import com.golsaint.modules.competicion.entity.Competicion;
import com.golsaint.modules.equipo.entity.Equipo;
import com.golsaint.modules.equipo.repository.EquipoRepository;
import com.golsaint.shared.response.ApiResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import com.golsaint.modules.competicion.repository.CompeticionRepository;
import com.golsaint.modules.partido.repository.PartidoRepository;
import com.golsaint.modules.partido.entity.Partido;

/**
 * Controlador REST para activar manualmente la sincronización de datos deportivos.
 * Expone endpoints granulares para cada tipo de sincronización.
 */
/**
 * Controlador REST para gestionar las operaciones de Sync.
 *
 * @author Rubiel Andrés Díaz
 */

@Slf4j
@RestController
@RequestMapping("/api/v1/sync")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class SyncController {

    private final MatchSyncJob matchSyncJob;
    private final PlayerSyncJob playerSyncJob;
    private final CompetitionSyncJob competitionSyncJob;
    private final TeamSyncJob teamSyncJob;
    private final EquipoRepository equipoRepository;
    private final CompeticionRepository competicionRepository;
    private final PartidoRepository partidoRepository;
    private final ApiConfig apiConfig;

    // ── Sync completo (todas las competiciones) ──────────────────────────────

    /**
     * POST /api/v1/sync
     * Lanza la sincronización completa de todas las competiciones configuradas en segundo plano.
     */
    @PostMapping
    public ResponseEntity<ApiResponse<Map<String, Object>>> triggerSync() {
        Map<String, Object> info = new HashMap<>();
        int totalCompeticiones = apiConfig.getFootballdata().getCompetitions().size();
        info.put("competiciones", totalCompeticiones);
        info.put("estado", "INICIADO");
        info.put("mensaje", "El proceso puede tardar varios minutos debido a los límites de la API gratuita (6 seg entre llamadas).");

        new Thread(matchSyncJob::runSync).start();
        log.info("[SyncController] Sync completo iniciado — {} competiciones a procesar", totalCompeticiones);

        return ResponseEntity.ok(new ApiResponse<>(true, "Sincronización completa iniciada en segundo plano", info));
    }

    // ── Sync por competición específica ──────────────────────────────────────

    /**
     * POST /api/v1/sync/competicion/{code}
     * Sincroniza solo la competición con el código dado (ej: "PL", "SA", "BL1").
     */
    @PostMapping("/competicion/{code}")
    public ResponseEntity<ApiResponse<String>> syncCompeticion(@PathVariable String code) {
        ApiConfig.FootballData.Competicion comp = apiConfig.getFootballdata().getCompetitions()
                .stream()
                .filter(c -> c.getCode().equalsIgnoreCase(code))
                .findFirst()
                .orElse(null);

        if (comp == null) {
            return ResponseEntity.badRequest()
                    .body(new ApiResponse<>(false, "Código de competición no encontrado: " + code, null));
        }

        final ApiConfig.FootballData.Competicion compFinal = comp;
        new Thread(() -> matchSyncJob.syncCompeticionPublic(compFinal)).start();

        log.info("[SyncController] Sync de competición iniciado: {} ({})", comp.getNombre(), code);
        return ResponseEntity.ok(new ApiResponse<>(true,
                "Sincronizando competición '" + comp.getNombre() + "' en segundo plano", "INICIADO"));
    }

    // ── Sync de jugadores para equipos existentes ─────────────────────────────

    /**
     * POST /api/v1/sync/jugadores
     * Busca todos los equipos guardados que aún no tienen jugadores y los sincroniza.
     */
    @PostMapping("/jugadores")
    public ResponseEntity<ApiResponse<Map<String, Object>>> syncJugadores() {
        List<Equipo> todosEquipos = equipoRepository.findAll();

        new Thread(() -> {
            int procesados = 0;
            int conJugadores = 0;
            for (Equipo equipo : todosEquipos) {
                try {
                    long jugadoresActuales = equipo.getId() != null
                            ? playerSyncJob.countJugadoresByEquipo(equipo.getId())
                            : 0;
                    if (jugadoresActuales == 0) {
                        log.info("[SyncJugadores] Procesando equipo sin jugadores: {}", equipo.getNombre());
                        playerSyncJob.syncPlayersForTeam(equipo);
                        procesados++;
                        Thread.sleep(3000); // Pausa para respetar rate limit de TheSportsDB
                    } else {
                        conJugadores++;
                    }
                } catch (InterruptedException ie) {
                    Thread.currentThread().interrupt();
                    break;
                } catch (Exception e) {
                    log.warn("[SyncJugadores] Error en equipo {}: {}", equipo.getNombre(), e.getMessage());
                }
            }
            log.info("[SyncJugadores] Completado — {} equipos procesados, {} ya tenían jugadores", procesados, conJugadores);
        }).start();

        Map<String, Object> info = new HashMap<>();
        info.put("equiposTotal", todosEquipos.size());
        info.put("estado", "INICIADO");

        return ResponseEntity.ok(new ApiResponse<>(true,
                "Sincronización de jugadores iniciada en segundo plano para " + todosEquipos.size() + " equipos", info));
    }

    // ── Sync de competiciones base ────────────────────────────────────────────

    /**
     * POST /api/v1/sync/competiciones
     * Asegura que todas las competiciones configuradas existen en la BD.
     */
    @PostMapping("/competiciones")
    public ResponseEntity<ApiResponse<Map<String, Object>>> syncCompeticiones() {
        List<ApiConfig.FootballData.Competicion> configs = apiConfig.getFootballdata().getCompetitions();
        int creadas = 0;
        for (ApiConfig.FootballData.Competicion c : configs) {
            Competicion comp = competitionSyncJob.getOrCreateCompeticion(c, null);
            if (comp != null) creadas++;
        }

        Map<String, Object> info = new HashMap<>();
        info.put("competicionesConfiguradas", configs.size());
        info.put("procesadas", creadas);

        log.info("[SyncController] Sync de competiciones completado: {}/{}", creadas, configs.size());
        return ResponseEntity.ok(new ApiResponse<>(true, "Competiciones sincronizadas", info));
    }

    /**
     * POST /api/v1/sync/escudos
     * Ejecuta el proceso de curación de escudos faltantes en segundo plano.
     */
    @PostMapping("/escudos")
    public ResponseEntity<ApiResponse<String>> syncEscudos() {
        new Thread(teamSyncJob::healMissingLogos).start();
        log.info("[SyncController] Tarea de curación de escudos iniciada en segundo plano");
        return ResponseEntity.ok(new ApiResponse<>(true, "Curación de escudos faltantes iniciada en segundo plano", "INICIADO"));
    }

    // ── Estado del sistema ─────────────────────────────────────────────────────

    /**
     * GET /api/v1/sync/status
     * Devuelve las competiciones disponibles para sincronizar.
     */
    @GetMapping("/status")
    public ResponseEntity<ApiResponse<Map<String, Object>>> status() {
        List<Map<String, String>> competiciones = apiConfig.getFootballdata().getCompetitions()
                .stream()
                .map(c -> {
                    Map<String, String> m = new HashMap<>();
                    m.put("code", c.getCode());
                    m.put("nombre", c.getNombre());
                    m.put("tipo", c.getTipo());
                    return m;
                })
                .toList();

        Map<String, Object> info = new HashMap<>();
        info.put("competicionesDisponibles", competiciones);
        info.put("totalCompeticiones", competiciones.size());
        info.put("endpoints", List.of(
                "POST /api/v1/sync → Sync completo (todas las competiciones)",
                "POST /api/v1/sync/competicion/{code} → Sync de una sola competición",
                "POST /api/v1/sync/jugadores → Sync jugadores para equipos existentes",
                "POST /api/v1/sync/competiciones → Crear registros de competiciones en BD",
                "POST /api/v1/sync/escudos → Curación/reparación de escudos faltantes"
        ));

        return ResponseEntity.ok(new ApiResponse<>(true, "GOL SAINT Sync Status", info));
    }

    // ── Metadata Incremental para Flutter ─────────────────────────────────────

    /**
     * GET /api/v1/sync/metadata
     * Retorna datos nuevos/modificados desde la marca de tiempo dada.
     * Es consumido por el SyncService de la app Flutter para la sincronización local-first.
     */
    @GetMapping("/metadata")
    public ResponseEntity<Map<String, Object>> getMetadata(@RequestParam(required = false) String since) {
        log.info("[SyncController] Consulta de metadatos incremental, since: {}", since);
        
        LocalDateTime sinceTime = null;
        if (since != null && !since.isEmpty()) {
            try {
                sinceTime = OffsetDateTime.parse(since).toLocalDateTime();
            } catch (Exception e) {
                try {
                    sinceTime = LocalDateTime.parse(since);
                } catch (Exception ex) {
                    log.warn("No se pudo parsear la fecha since: {}", since);
                }
            }
        }

        final LocalDateTime finalSince = sinceTime;
        List<Competicion> ligas = competicionRepository.findAll();
        List<Equipo> equipos = equipoRepository.findAll();
        List<Partido> partidos = partidoRepository.findAll();

        if (finalSince != null) {
            ligas = ligas.stream().filter(l -> l.getUpdatedAt() != null && l.getUpdatedAt().isAfter(finalSince)).toList();
            equipos = equipos.stream().filter(e -> e.getUpdatedAt() != null && e.getUpdatedAt().isAfter(finalSince)).toList();
            partidos = partidos.stream().filter(p -> p.getUpdatedAt() != null && p.getUpdatedAt().isAfter(finalSince)).toList();
        }

        Map<String, Object> responseData = new HashMap<>();
        boolean hasChanges = !ligas.isEmpty() || !equipos.isEmpty() || !partidos.isEmpty();
        responseData.put("hasChanges", hasChanges);

        List<Map<String, Object>> ligasMapped = ligas.stream().map(l -> {
            Map<String, Object> m = new HashMap<>();
            m.put("id", l.getId());
            m.put("nombre", l.getNombre());
            m.put("pais", "Mundial");
            m.put("logoUrl", l.getLogoUrl());
            m.put("banderaUrl", null);
            m.put("temporada", 2026);
            m.put("updatedAt", l.getUpdatedAt() != null ? l.getUpdatedAt().toString() : LocalDateTime.now().toString());
            return m;
        }).toList();
        responseData.put("ligas", ligasMapped);

        List<Map<String, Object>> equiposMapped = equipos.stream().map(e -> {
            Map<String, Object> m = new HashMap<>();
            m.put("id", e.getId());
            m.put("nombre", e.getNombre());
            m.put("ligaId", 2000); 
            m.put("pais", e.getPais());
            m.put("escudoUrl", e.getEscudoUrl());
            m.put("banderaUrl", null);
            m.put("updatedAt", e.getUpdatedAt() != null ? e.getUpdatedAt().toString() : LocalDateTime.now().toString());
            return m;
        }).toList();
        responseData.put("equipos", equiposMapped);

        List<Map<String, Object>> partidosMapped = partidos.stream().map(p -> {
            Map<String, Object> m = new HashMap<>();
            m.put("id", p.getId());
            
            Map<String, Object> local = new HashMap<>();
            local.put("id", p.getEquipoLocal() != null ? p.getEquipoLocal().getId() : 0);
            local.put("nombre", p.getEquipoLocal() != null ? p.getEquipoLocal().getNombre() : "Local");
            local.put("escudoUrl", p.getEquipoLocal() != null ? p.getEquipoLocal().getEscudoUrl() : null);
            m.put("equipoLocal", local);
            
            Map<String, Object> visitante = new HashMap<>();
            visitante.put("id", p.getEquipoVisitante() != null ? p.getEquipoVisitante().getId() : 0);
            visitante.put("nombre", p.getEquipoVisitante() != null ? p.getEquipoVisitante().getNombre() : "Visitante");
            visitante.put("escudoUrl", p.getEquipoVisitante() != null ? p.getEquipoVisitante().getEscudoUrl() : null);
            m.put("equipoVisitante", visitante);
            
            m.put("ligaId", p.getCompeticion() != null ? p.getCompeticion().getId() : 2000);
            m.put("fecha", p.getFecha() != null ? p.getFecha().toString() : OffsetDateTime.now().toString());
            m.put("estado", p.getEstado());
            m.put("golesLocal", p.getGolesLocal());
            m.put("golesVisitante", p.getGolesVisitante());
            m.put("updatedAt", p.getUpdatedAt() != null ? p.getUpdatedAt().toString() : LocalDateTime.now().toString());
            return m;
        }).toList();
        responseData.put("partidos", partidosMapped);

        return ResponseEntity.ok(responseData);
    }
}
