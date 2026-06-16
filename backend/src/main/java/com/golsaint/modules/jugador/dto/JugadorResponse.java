package com.golsaint.modules.jugador.dto;

import com.golsaint.modules.equipo.dto.EquipoResponse;
import java.time.LocalDateTime;

/**
 * DTO para la respuesta con datos de un jugador.
 */
public record JugadorResponse(
    Long id,
    String nombre,
    Integer edad,
    EquipoResponse equipo,
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
