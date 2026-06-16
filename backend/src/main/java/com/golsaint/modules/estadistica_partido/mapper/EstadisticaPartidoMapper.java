package com.golsaint.modules.estadistica_partido.mapper;

import com.golsaint.modules.estadistica_partido.dto.EstadisticaPartidoResponse;
import com.golsaint.modules.estadistica_partido.entity.EstadisticaPartido;

/**
 * Mapper para la entidad EstadisticaPartido.
 */
/**
 * Mapper para convertir entre la entidad EstadisticaPartido y sus DTOs.
 *
 * @author Rubiel Andrés Díaz
 */

public class EstadisticaPartidoMapper {

    public static EstadisticaPartidoResponse toResponse(EstadisticaPartido entity) {
        if (entity == null) return null;
        return new EstadisticaPartidoResponse(
            entity.getId(),
            entity.getPartido() != null ? entity.getPartido().getId() : null,
            entity.getPosesionLocal(),
            entity.getPosesionVisitante(),
            entity.getTirosLocal(),
            entity.getTirosVisitante(),
            entity.getCorners(),
            entity.getCreatedAt(),
            entity.getUpdatedAt()
        );
    }
}
