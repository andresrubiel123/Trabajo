package com.golsaint.modules.equipo.mapper;

import com.golsaint.modules.equipo.dto.EquipoResponse;
import com.golsaint.modules.equipo.entity.Equipo;
import com.golsaint.modules.pais.mapper.PaisMapper;

/**
 * Mapper para la entidad Equipo.
 */
/**
 * Mapper para convertir entre la entidad Equipo y sus DTOs.
 *
 * @author Rubiel Andrés Díaz
 */

public class EquipoMapper {

    public static EquipoResponse toResponse(Equipo entity) {
        if (entity == null) return null;
        return new EquipoResponse(
            entity.getId(),
            entity.getNombre(),
            entity.getPais(),
            entity.getEscudoUrl(),
            entity.getRatingGeneral(),
            entity.getApiFootballDataId(),
            entity.getApiSportsDbId(),
            PaisMapper.toResponse(entity.getPaisRel()),
            entity.getCreatedAt(),
            entity.getUpdatedAt()
        );
    }
}
