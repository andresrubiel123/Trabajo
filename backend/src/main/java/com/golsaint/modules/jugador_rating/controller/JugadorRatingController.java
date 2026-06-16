package com.golsaint.modules.jugador_rating.controller;

import com.golsaint.modules.jugador_rating.dto.JugadorRatingRequest;
import com.golsaint.modules.jugador_rating.dto.JugadorRatingResponse;
import com.golsaint.modules.jugador_rating.service.JugadorRatingService;
import com.golsaint.shared.response.ApiResponse;
import com.golsaint.shared.response.PageResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * Controlador REST para gestionar ratings de jugadores bajo api/v1.
 */
/**
 * Controlador REST para gestionar las operaciones de JugadorRating.
 *
 * @author Rubiel Andrés Díaz
 */

@RestController
@RequestMapping("/api/v1/jugadores/{jugadorId}/ratings")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class JugadorRatingController {

    private final JugadorRatingService jugadorRatingService;

    @GetMapping
    public ResponseEntity<ApiResponse<PageResponse<JugadorRatingResponse>>> getRatingsByJugador(
            @PathVariable Long jugadorId, Pageable pageable) {
        PageResponse<JugadorRatingResponse> response = PageResponse.from(
                jugadorRatingService.getRatingsByJugador(jugadorId, pageable));
        return ResponseEntity.ok(new ApiResponse<>(true, "Ratings del jugador obtenidos con éxito", response));
    }

    @PostMapping
    public ResponseEntity<ApiResponse<JugadorRatingResponse>> addRating(
            @PathVariable Long jugadorId, @RequestBody JugadorRatingRequest request) {
        JugadorRatingResponse response = jugadorRatingService.addRating(jugadorId, request);
        return new ResponseEntity<>(new ApiResponse<>(true, "Rating agregado con éxito", response), HttpStatus.CREATED);
    }
}
