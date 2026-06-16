package com.golsaint.modules.equipo.repository;

import com.golsaint.modules.equipo.entity.Equipo;
import org.springframework.data.mongodb.repository.MongoRepository;
import java.util.Optional;

/**
 * Repositorio MongoDB para acceder a los datos de la colección equipos.
 */
/**
 * Repositorio MongoDB para gestionar el acceso a datos de Equipo.
 *
 * @author Rubiel Andrés Díaz
 */

public interface EquipoRepository extends MongoRepository<Equipo, Long> {
    Optional<Equipo> findByNombre(String nombre);
}
