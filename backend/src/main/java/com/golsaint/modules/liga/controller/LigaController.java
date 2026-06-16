package com.golsaint.modules.liga.controller;

import com.golsaint.modules.liga.dto.LigaRequest;
import com.golsaint.modules.liga.dto.LigaResponse;
import com.golsaint.modules.liga.service.LigaService;
import com.golsaint.shared.response.ApiResponse;
import com.golsaint.shared.response.PageResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * Controlador REST para gestionar ligas bajo api/v1.
 */
/**
 * Controlador REST para gestionar las operaciones de Liga.
 *
 * @author Rubiel Andrés Díaz
 */

@RestController
@RequestMapping("/api/v1/ligas")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class LigaController {

    private final LigaService ligaService;

    @GetMapping
    public ResponseEntity<ApiResponse<PageResponse<LigaResponse>>> getLigas(Pageable pageable) {
        PageResponse<LigaResponse> response = PageResponse.from(ligaService.getLigas(pageable));
        return ResponseEntity.ok(new ApiResponse<>(true, "Listado de ligas obtenido con éxito", response));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<LigaResponse>> getLigaById(@PathVariable Long id) {
        LigaResponse response = ligaService.getLigaById(id);
        return ResponseEntity.ok(new ApiResponse<>(true, "Liga obtenida con éxito", response));
    }

    @PostMapping
    public ResponseEntity<ApiResponse<LigaResponse>> createLiga(@RequestBody LigaRequest request) {
        LigaResponse response = ligaService.createLiga(request);
        return new ResponseEntity<>(new ApiResponse<>(true, "Liga creada con éxito", response), HttpStatus.CREATED);
    }
}
