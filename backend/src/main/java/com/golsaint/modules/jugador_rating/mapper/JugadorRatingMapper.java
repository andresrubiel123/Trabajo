package com.golsaint.modules.jugador_rating.mapper;

import com.golsaint.modules.jugador_rating.dto.JugadorRatingResponse;
import com.golsaint.modules.jugador_rating.entity.JugadorRating;

/**
 * Mapper para la entidad JugadorRating.
 */
/**
 * Mapper para convertir entre la entidad JugadorRating y sus DTOs.
 *
 * @author Rubiel Andrés Díaz
 */

public class JugadorRatingMapper {

    public static JugadorRatingResponse toResponse(JugadorRating entity) {
        if (entity == null) return null;
        return new JugadorRatingResponse(
            entity.getId(),
            entity.getJugador() != null ? entity.getJugador().getId() : null,
            entity.getFecha(),
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
