package com.golsaint.modules.cuota.mapper;

import com.golsaint.modules.cuota.dto.CuotaResponse;
import com.golsaint.modules.cuota.entity.Cuota;

/**
 * Mapper para la entidad Cuota.
 */
/**
 * Mapper para convertir entre la entidad Cuota y sus DTOs.
 *
 * @author Rubiel Andrés Díaz
 */

public class CuotaMapper {

    public static CuotaResponse toResponse(Cuota entity) {
        if (entity == null) return null;
        return new CuotaResponse(
            entity.getId(),
            entity.getPartido() != null ? entity.getPartido().getId() : null,
            entity.getLocal(),
            entity.getEmpate(),
            entity.getVisitante(),
            entity.getCasaApuesta(),
            entity.getFechaActualizacion(),
            entity.getCreatedAt(),
            entity.getUpdatedAt()
        );
    }
}
