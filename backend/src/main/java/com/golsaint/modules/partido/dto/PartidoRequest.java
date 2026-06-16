package com.golsaint.modules.partido.dto;

import java.time.OffsetDateTime;

/**
 * DTO para la petición de creación/actualización de un partido.
 */
public record PartidoRequest(
    Long equipoLocalId,
    Long equipoVisitanteId,
    OffsetDateTime fecha,
    String estado,
    Long competicionId
) {}
