package com.golsaint.modules.jugador.mapper;

import com.golsaint.modules.equipo.mapper.EquipoMapper;
import com.golsaint.modules.jugador.dto.JugadorResponse;
import com.golsaint.modules.jugador.entity.Jugador;

/**
 * Mapper para la entidad Jugador.
 */
/**
 * Mapper para convertir entre la entidad Jugador y sus DTOs.
 *
 * @author Rubiel Andrés Díaz
 */

public class JugadorMapper {

    public static JugadorResponse toResponse(Jugador entity) {
        if (entity == null) return null;
        return new JugadorResponse(
            entity.getId(),
            entity.getNombre(),
            entity.getEdad(),
            EquipoMapper.toResponse(entity.getEquipo()),
            entity.getVelocidad(),
            entity.getDefinicion(),
            entity.getPase(),
            entity.getRegate(),
            entity.getDefensa(),
            entity.getFisico(),
            entity.getRatingGeneral(),
            entity.getCreatedAt(),
            entity.getUpdatedAt()
        );
    }
}
