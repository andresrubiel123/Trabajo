package com.golsaint.modules.competicion.controller;

import com.golsaint.modules.competicion.dto.CompeticionRequest;
import com.golsaint.modules.competicion.dto.CompeticionResponse;
import com.golsaint.modules.competicion.service.CompeticionService;
import com.golsaint.shared.response.ApiResponse;
import com.golsaint.shared.response.PageResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * Controlador REST para gestionar competiciones bajo api/v1.
 */
/**
 * Controlador REST para gestionar las operaciones de Competicion.
 *
 * @author Rubiel Andrés Díaz
 */

@RestController
@RequestMapping("/api/v1/competiciones")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class CompeticionController {

    private final CompeticionService competicionService;

    @GetMapping
    public ResponseEntity<ApiResponse<PageResponse<CompeticionResponse>>> getCompeticiones(Pageable pageable) {
        PageResponse<CompeticionResponse> response = PageResponse.from(competicionService.getCompeticiones(pageable));
        return ResponseEntity.ok(new ApiResponse<>(true, "Listado de competiciones obtenido con éxito", response));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<CompeticionResponse>> getCompeticionById(@PathVariable Long id) {
        CompeticionResponse response = competicionService.getCompeticionById(id);
        return ResponseEntity.ok(new ApiResponse<>(true, "Competición obtenida con éxito", response));
    }

    @PostMapping
    public ResponseEntity<ApiResponse<CompeticionResponse>> createCompeticion(@RequestBody CompeticionRequest request) {
        CompeticionResponse response = competicionService.createCompeticion(request);
        return new ResponseEntity<>(new ApiResponse<>(true, "Competición creada con éxito", response), HttpStatus.CREATED);
    }
}
