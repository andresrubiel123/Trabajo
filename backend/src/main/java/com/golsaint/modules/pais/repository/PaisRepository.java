package com.golsaint.modules.pais.repository;

import com.golsaint.modules.pais.entity.Pais;
import org.springframework.data.mongodb.repository.MongoRepository;
import java.util.Optional;

/**
 * Repositorio MongoDB para acceder a los datos de la colección paises.
 */
/**
 * Repositorio MongoDB para gestionar el acceso a datos de Pais.
 *
 * @author Rubiel Andrés Díaz
 */

public interface PaisRepository extends MongoRepository<Pais, Long> {
    Optional<Pais> findByCodigo(String codigo);
    Optional<Pais> findByNombre(String nombre);
}
