package com.golsaint.modules.competicion.repository;

import com.golsaint.modules.competicion.entity.Competicion;
import org.springframework.data.mongodb.repository.MongoRepository;
import java.util.Optional;

/**
 * Repositorio MongoDB para acceder a los datos de la colección competiciones.
 */
/**
 * Repositorio MongoDB para gestionar el acceso a datos de Competicion.
 *
 * @author Rubiel Andrés Díaz
 */

public interface CompeticionRepository extends MongoRepository<Competicion, Long> {
    Optional<Competicion> findByNombre(String nombre);
}
