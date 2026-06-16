package com.golsaint.modules.partido.mapper;

import com.golsaint.modules.competicion.mapper.CompeticionMapper;
import com.golsaint.modules.equipo.mapper.EquipoMapper;
import com.golsaint.modules.partido.dto.PartidoResponse;
import com.golsaint.modules.partido.entity.Partido;

/**
 * Mapper para la entidad Partido.
 */
/**
 * Mapper para convertir entre la entidad Partido y sus DTOs.
 *
 * @author Rubiel Andrés Díaz
 */

public class PartidoMapper {

    public static PartidoResponse toResponse(Partido entity) {
        if (entity == null) return null;
        return new PartidoResponse(
            entity.getId(),
            EquipoMapper.toResponse(entity.getEquipoLocal()),
            EquipoMapper.toResponse(entity.getEquipoVisitante()),
            entity.getFecha(),
            entity.getEstado(),
            entity.getGolesLocal(),
            entity.getGolesVisitante(),
            entity.getGanador(),
            CompeticionMapper.toResponse(entity.getCompeticion()),
            entity.getCreatedAt(),
            entity.getUpdatedAt()
        );
    }
}
