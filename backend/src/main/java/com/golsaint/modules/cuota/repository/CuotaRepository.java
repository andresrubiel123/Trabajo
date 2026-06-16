package com.golsaint.modules.cuota.repository;

import com.golsaint.modules.cuota.entity.Cuota;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;
import java.util.List;

/**
 * Repositorio MongoDB para acceder a los datos de la colección cuotas.
 */
/**
 * Repositorio MongoDB para gestionar el acceso a datos de Cuota.
 *
 * @author Rubiel Andrés Díaz
 */

public interface CuotaRepository extends MongoRepository<Cuota, Long> {
    Page<Cuota> findByPartidoId(Long partidoId, Pageable pageable);
    List<Cuota> findByPartidoId(Long partidoId);
}
