package com.golsaint.modules.equipo.dto;

import com.golsaint.modules.pais.dto.PaisResponse;
import java.time.LocalDateTime;

/**
 * DTO para la respuesta con datos de un equipo.
 */
public record EquipoResponse(
    Long id,
    String nombre,
    String pais,
    String escudoUrl,
    Integer ratingGeneral,
    Integer apiFootballDataId,
    Integer apiSportsDbId,
    PaisResponse paisRel,
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {}
