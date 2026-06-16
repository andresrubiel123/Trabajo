package com.golsaint.modules.cuota.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * DTO para la respuesta con datos de una cuota.
 */
public record CuotaResponse(
    Long id,
    Long partidoId,
    BigDecimal local,
    BigDecimal empate,
    BigDecimal visitante,
    String casaApuesta,
    LocalDateTime fechaActualizacion,
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {}
