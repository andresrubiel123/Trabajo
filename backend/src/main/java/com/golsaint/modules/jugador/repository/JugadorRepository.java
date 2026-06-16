package com.golsaint.modules.jugador.repository;

import com.golsaint.modules.jugador.entity.Jugador;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;
import java.util.List;

/**
 * Repositorio MongoDB para acceder a los datos de la colección jugadores.
 */
/**
 * Repositorio MongoDB para gestionar el acceso a datos de Jugador.
 *
 * @author Rubiel Andrés Díaz
 */

public interface JugadorRepository extends MongoRepository<Jugador, Long> {
    Page<Jugador> findByEquipoId(Long equipoId, Pageable pageable);
    List<Jugador> findByEquipoId(Long equipoId);
}
