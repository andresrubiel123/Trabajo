package com.golsaint.modules.estadistica_partido.dto;

import java.time.LocalDateTime;

/**
 * DTO para la respuesta con datos de las estadísticas de un partido.
 */
public record EstadisticaPartidoResponse(
    Long id,
    Long partidoId,
    Integer posesionLocal,
    Integer posesionVisitante,
    Integer tirosLocal,
    Integer tirosVisitante,
    Integer corners,
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {}
