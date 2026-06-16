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
            Competicion comp = competitionSyncJob.getOrCreateCompeticion(c);
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
}
