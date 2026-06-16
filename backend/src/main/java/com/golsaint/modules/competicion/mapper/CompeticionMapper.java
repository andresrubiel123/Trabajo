package com.golsaint.modules.competicion.mapper;

import com.golsaint.modules.competicion.dto.CompeticionResponse;
import com.golsaint.modules.competicion.entity.Competicion;

/**
 * Mapper para la entidad Competicion.
 */
/**
 * Mapper para convertir entre la entidad Competicion y sus DTOs.
 *
 * @author Rubiel Andrés Díaz
 */

public class CompeticionMapper {

    public static CompeticionResponse toResponse(Competicion entity) {
        if (entity == null) return null;
        return new CompeticionResponse(
            entity.getId(),
            entity.getNombre(),
            entity.getTipo(),
            entity.getLogoUrl(),
            entity.getCreatedAt(),
            entity.getUpdatedAt()
        );
    }
}
