package com.golsaint.modules.jugador_rating.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * DTO para la respuesta con datos de un rating de jugador.
 */
public record JugadorRatingResponse(
    Long id,
    Long jugadorId,
    LocalDate fecha,
    Integer velocidad,
    Integer definicion,
    Integer pase,
    Integer regate,
    Integer defensa,
    Integer fisico,
    Integer ratingGeneral,
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {}
