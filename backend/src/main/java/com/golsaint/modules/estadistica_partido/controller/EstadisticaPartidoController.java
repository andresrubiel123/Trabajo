package com.golsaint.modules.estadistica_partido.controller;

import com.golsaint.modules.estadistica_partido.dto.EstadisticaPartidoRequest;
import com.golsaint.modules.estadistica_partido.dto.EstadisticaPartidoResponse;
import com.golsaint.modules.estadistica_partido.service.EstadisticaPartidoService;
import com.golsaint.shared.response.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * Controlador REST para gestionar estadísticas de partidos bajo api/v1.
 */
/**
 * Controlador REST para gestionar las operaciones de EstadisticaPartido.
 *
 * @author Rubiel Andrés Díaz
 */

@RestController
@RequestMapping("/api/v1/partidos/{partidoId}/estadisticas")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class EstadisticaPartidoController {

    private final EstadisticaPartidoService estadisticaPartidoService;

    @GetMapping
    public ResponseEntity<ApiResponse<EstadisticaPartidoResponse>> getEstadisticas(@PathVariable Long partidoId) {
        EstadisticaPartidoResponse response = estadisticaPartidoService.getEstadisticasByPartido(partidoId);
        return ResponseEntity.ok(new ApiResponse<>(true, "Estadísticas obtenidas con éxito", response));
    }

    @PostMapping
    public ResponseEntity<ApiResponse<EstadisticaPartidoResponse>> updateEstadisticas(
            @PathVariable Long partidoId, @RequestBody EstadisticaPartidoRequest request) {
        EstadisticaPartidoResponse response = estadisticaPartidoService.updateEstadisticas(partidoId, request);
        return ResponseEntity.ok(new ApiResponse<>(true, "Estadísticas actualizadas con éxito", response));
    }
}
