package com.golsaint.modules.cuota.dto;

import java.math.BigDecimal;

/**
 * DTO para la petición de creación/actualización de una cuota de apuesta.
 */
public record CuotaRequest(
    BigDecimal local,
    BigDecimal empate,
    BigDecimal visitante,
    String casaApuesta
) {}
