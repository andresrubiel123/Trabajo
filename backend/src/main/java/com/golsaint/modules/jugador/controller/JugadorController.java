package com.golsaint.modules.jugador.controller;

import com.golsaint.modules.jugador.dto.JugadorRequest;
import com.golsaint.modules.jugador.dto.JugadorResponse;
import com.golsaint.modules.jugador.service.JugadorService;
import com.golsaint.shared.response.ApiResponse;
import com.golsaint.shared.response.PageResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * Controlador REST para gestionar jugadores bajo api/v1.
 */
/**
 * Controlador REST para gestionar las operaciones de Jugador.
 *
 * @author Rubiel Andrés Díaz
 */

@RestController
@RequestMapping("/api/v1/jugadores")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class JugadorController {

    private final JugadorService jugadorService;

    @GetMapping
    public ResponseEntity<ApiResponse<PageResponse<JugadorResponse>>> getJugadores(Pageable pageable) {
        PageResponse<JugadorResponse> response = PageResponse.from(jugadorService.getJugadores(pageable));
        return ResponseEntity.ok(new ApiResponse<>(true, "Listado de jugadores obtenido con éxito", response));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<JugadorResponse>> getJugadorById(@PathVariable Long id) {
        JugadorResponse response = jugadorService.getJugadorById(id);
        return ResponseEntity.ok(new ApiResponse<>(true, "Jugador obtenido con éxito", response));
    }

    @PostMapping
    public ResponseEntity<ApiResponse<JugadorResponse>> createJugador(@RequestBody JugadorRequest request) {
        JugadorResponse response = jugadorService.createJugador(request);
        return new ResponseEntity<>(new ApiResponse<>(true, "Jugador creado con éxito", response), HttpStatus.CREATED);
    }
}
