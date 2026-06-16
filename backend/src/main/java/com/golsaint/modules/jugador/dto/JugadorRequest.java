package com.golsaint.modules.jugador.dto;

/**
 * DTO para la petición de creación/actualización de un jugador.
 */
public record JugadorRequest(
    String nombre,
    Integer edad,
    Long equipoId,
    Integer velocidad,
    Integer definicion,
    Integer pase,
    Integer regate,
    Integer defensa,
    Integer fisico,
    Integer ratingGeneral
) {}
