package com.golsaint.modules.liga.dto;

/**
 * DTO para la petición de creación/actualización de una liga.
 */
public record LigaRequest(
    String nombre,
    Long paisId,
    String logoUrl
) {}
