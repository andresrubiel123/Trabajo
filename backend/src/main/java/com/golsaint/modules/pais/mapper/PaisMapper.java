package com.golsaint.modules.pais.mapper;

import com.golsaint.modules.pais.dto.PaisRequest;
import com.golsaint.modules.pais.dto.PaisResponse;
import com.golsaint.modules.pais.entity.Pais;

/**
 * Mapper para convertir entre la entidad Pais y sus DTOs correspondientes.
 */
/**
 * Mapper para convertir entre la entidad Pais y sus DTOs.
 *
 * @author Rubiel Andrés Díaz
 */

public class PaisMapper {

    public static PaisResponse toResponse(Pais entity) {
        if (entity == null) return null;
        return new PaisResponse(
            entity.getId(),
            entity.getCodigo(),
            entity.getNombre(),
            entity.getBanderaUrl(),
            entity.getCreatedAt(),
            entity.getUpdatedAt()
        );
    }

    public static Pais toEntity(PaisRequest request) {
        if (request == null) return null;
        return Pais.builder()
            .codigo(request.codigo())
            .nombre(request.nombre())
            .banderaUrl(request.banderaUrl())
            .build();
    }
}
