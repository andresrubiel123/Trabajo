package com.golsaint.modules.liga.mapper;

import com.golsaint.modules.liga.dto.LigaResponse;
import com.golsaint.modules.liga.entity.Liga;
import com.golsaint.modules.pais.mapper.PaisMapper;

/**
 * Mapper para la entidad Liga.
 */
/**
 * Mapper para convertir entre la entidad Liga y sus DTOs.
 *
 * @author Rubiel Andrés Díaz
 */

public class LigaMapper {

    public static LigaResponse toResponse(Liga entity) {
        if (entity == null) return null;
        return new LigaResponse(
            entity.getId(),
            entity.getNombre(),
            PaisMapper.toResponse(entity.getPais()),
            entity.getLogoUrl(),
            entity.getCreatedAt(),
            entity.getUpdatedAt()
        );
    }
}
