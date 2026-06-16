package com.golsaint.modules.competicion.dto;

/**
 * DTO para la petición de creación/actualización de una competición.
 */
public record CompeticionRequest(
    String nombre,
    String tipo,
    String logoUrl
) {}
