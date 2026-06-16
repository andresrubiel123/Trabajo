package com.golsaint.modules.cuota.controller;

import com.golsaint.modules.cuota.dto.CuotaRequest;
import com.golsaint.modules.cuota.dto.CuotaResponse;
import com.golsaint.modules.cuota.service.CuotaService;
import com.golsaint.shared.response.ApiResponse;
import com.golsaint.shared.response.PageResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * Controlador REST para gestionar cuotas de apuestas bajo api/v1.
 */
/**
 * Controlador REST para gestionar las operaciones de Cuota.
 *
 * @author Rubiel Andrés Díaz
 */

@RestController
@RequestMapping("/api/v1/partidos/{partidoId}/cuotas")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class CuotaController {

    private final CuotaService cuotaService;

    @GetMapping
    public ResponseEntity<ApiResponse<PageResponse<CuotaResponse>>> getCuotasByPartido(
            @PathVariable Long partidoId, Pageable pageable) {
        PageResponse<CuotaResponse> response = PageResponse.from(cuotaService.getCuotasByPartido(partidoId, pageable));
        return ResponseEntity.ok(new ApiResponse<>(true, "Cuotas del partido obtenidas con éxito", response));
    }

    @PostMapping
    public ResponseEntity<ApiResponse<CuotaResponse>> addCuota(
            @PathVariable Long partidoId, @RequestBody CuotaRequest request) {
        CuotaResponse response = cuotaService.addCuota(partidoId, request);
        return new ResponseEntity<>(new ApiResponse<>(true, "Cuota agregada con éxito", response), HttpStatus.CREATED);
    }
}
