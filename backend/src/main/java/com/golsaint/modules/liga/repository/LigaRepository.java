package com.golsaint.modules.liga.repository;

import com.golsaint.modules.liga.entity.Liga;
import org.springframework.data.mongodb.repository.MongoRepository;
import java.util.Optional;

/**
 * Repositorio MongoDB para acceder a los datos de la colección ligas.
 */
/**
 * Repositorio MongoDB para gestionar el acceso a datos de Liga.
 *
 * @author Rubiel Andrés Díaz
 */

public interface LigaRepository extends MongoRepository<Liga, Long> {
    Optional<Liga> findByNombre(String nombre);
}
