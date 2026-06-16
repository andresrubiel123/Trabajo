package com.golsaint.modules.jugador_rating.repository;

import com.golsaint.modules.jugador_rating.entity.JugadorRating;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;
import java.util.List;

/**
 * Repositorio MongoDB para acceder a los datos de la colección jugador_ratings.
 */
/**
 * Repositorio MongoDB para gestionar el acceso a datos de JugadorRating.
 *
 * @author Rubiel Andrés Díaz
 */

public interface JugadorRatingRepository extends MongoRepository<JugadorRating, Long> {
    Page<JugadorRating> findByJugadorIdOrderByFechaDesc(Long jugadorId, Pageable pageable);
    List<JugadorRating> findByJugadorIdOrderByFechaDesc(Long jugadorId);
}
