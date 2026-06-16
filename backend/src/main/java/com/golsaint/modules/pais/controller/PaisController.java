package com.golsaint.modules.pais.controller;

import com.golsaint.modules.pais.dto.PaisRequest;
import com.golsaint.modules.pais.dto.PaisResponse;
import com.golsaint.modules.pais.service.PaisService;
import com.golsaint.shared.response.ApiResponse;
import com.golsaint.shared.response.PageResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * Controlador REST para la gestión de países bajo la versión api/v1.
 */
/**
 * Controlador REST para gestionar las operaciones de Pais.
 *
 * @author Rubiel Andrés Díaz
 */

@RestController
@RequestMapping("/api/v1/paises")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class PaisController {

    private final PaisService paisService;

    @GetMapping
    public ResponseEntity<ApiResponse<PageResponse<PaisResponse>>> getPaises(Pageable pageable) {
        PageResponse<PaisResponse> response = PageResponse.from(paisService.getPaises(pageable));
        return ResponseEntity.ok(new ApiResponse<>(true, "Listado de países obtenido con éxito", response));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<PaisResponse>> getPaisById(@PathVariable Long id) {
        PaisResponse response = paisService.getPaisById(id);
        return ResponseEntity.ok(new ApiResponse<>(true, "País obtenido con éxito", response));
    }

    @PostMapping
    public ResponseEntity<ApiResponse<PaisResponse>> createPais(@RequestBody PaisRequest request) {
        PaisResponse response = paisService.createPais(request);
        return new ResponseEntity<>(new ApiResponse<>(true, "País creado con éxito", response), HttpStatus.CREATED);
    }
}
