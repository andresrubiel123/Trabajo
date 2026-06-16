package com.golsaint.modules.equipo.dto;

/**
 * DTO para la petición de creación/actualización de un equipo.
 */
public record EquipoRequest(
    String nombre,
    String pais,
    String escudoUrl,
    Integer ratingGeneral,
    Integer apiFootballDataId,
    Integer apiSportsDbId,
    Long paisId
) {}
