package com.golsaint.modules.estadistica_partido.repository;

import com.golsaint.modules.estadistica_partido.entity.EstadisticaPartido;
import org.springframework.data.mongodb.repository.MongoRepository;
import java.util.Optional;

/**
 * Repositorio MongoDB para acceder a los datos de la colección estadisticas_partido.
 */
/**
 * Repositorio MongoDB para gestionar el acceso a datos de EstadisticaPartido.
 *
 * @author Rubiel Andrés Díaz
 */

public interface EstadisticaPartidoRepository extends MongoRepository<EstadisticaPartido, Long> {
    Optional<EstadisticaPartido> findByPartidoId(Long partidoId);
}
