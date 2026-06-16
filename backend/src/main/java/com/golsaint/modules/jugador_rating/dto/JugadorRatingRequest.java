package com.golsaint.modules.jugador_rating.dto;

import java.time.LocalDate;

/**
 * DTO para la petición de creación/actualización de un rating de jugador.
 */
public record JugadorRatingRequest(
    LocalDate fecha,
    Integer velocidad,
    Integer definicion,
    Integer pase,
    Integer regate,
    Integer defensa,
    Integer fisico,
    Integer ratingGeneral
) {}
