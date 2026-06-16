package com.golsaint.modules.partido.repository;

import com.golsaint.modules.partido.entity.Partido;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * Repositorio MongoDB para acceder a los datos de la colección partidos.
 */
/**
 * Repositorio MongoDB para gestionar el acceso a datos de Partido.
 *
 * @author Rubiel Andrés Díaz
 */

public interface PartidoRepository extends MongoRepository<Partido, Long> {
    Page<Partido> findByCompeticionId(Long competicionId, Pageable pageable);
}
