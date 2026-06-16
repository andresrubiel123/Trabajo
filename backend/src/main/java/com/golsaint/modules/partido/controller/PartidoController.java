package com.golsaint.modules.partido.controller;

import com.golsaint.modules.partido.dto.PartidoRequest;
import com.golsaint.modules.partido.dto.PartidoResponse;
import com.golsaint.modules.partido.service.PartidoService;
import com.golsaint.shared.response.ApiResponse;
import com.golsaint.shared.response.PageResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * Controlador REST para gestionar partidos bajo api/v1.
 */
/**
 * Controlador REST para gestionar las operaciones de Partido.
 *
 * @author Rubiel Andrés Díaz
 */

@RestController
@RequestMapping("/api/v1/partidos")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class PartidoController {

    private final PartidoService partidoService;

    @GetMapping
    public ResponseEntity<ApiResponse<PageResponse<PartidoResponse>>> getPartidos(Pageable pageable) {
        PageResponse<PartidoResponse> response = PageResponse.from(partidoService.getPartidos(pageable));
        return ResponseEntity.ok(new ApiResponse<>(true, "Listado de partidos obtenido con éxito", response));
    }

    @GetMapping("/competicion/{id}")
    public ResponseEntity<ApiResponse<PageResponse<PartidoResponse>>> getPartidosByCompeticion(
            @PathVariable Long id, Pageable pageable) {
        PageResponse<PartidoResponse> response = PageResponse.from(partidoService.getPartidosByCompeticion(id, pageable));
        return ResponseEntity.ok(new ApiResponse<>(true, "Partidos de la competición obtenidos con éxito", response));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<PartidoResponse>> getPartidoById(@PathVariable Long id) {
        PartidoResponse response = partidoService.getPartidoById(id);
        return ResponseEntity.ok(new ApiResponse<>(true, "Partido obtenido con éxito", response));
    }

    @PostMapping
    public ResponseEntity<ApiResponse<PartidoResponse>> createPartido(@RequestBody PartidoRequest request) {
        PartidoResponse response = partidoService.createPartido(request);
        return new ResponseEntity<>(new ApiResponse<>(true, "Partido creado con éxito", response), HttpStatus.CREATED);
    }
}
