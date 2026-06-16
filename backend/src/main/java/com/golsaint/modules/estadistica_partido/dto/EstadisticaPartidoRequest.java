package com.golsaint.modules.estadistica_partido.dto;

/**
 * DTO para la petición de actualización de estadísticas de un partido.
 */
public record EstadisticaPartidoRequest(
    Integer posesionLocal,
    Integer posesionVisitante,
    Integer tirosLocal,
    Integer tirosVisitante,
    Integer corners
) {}
