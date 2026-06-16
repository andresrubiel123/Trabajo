package com.golsaint.modules.pais.dto;

import java.time.LocalDateTime;

/**
 * DTO para la respuesta con datos de un país.
 */
public record PaisResponse(
    Long id,
    String codigo,
    String nombre,
    String banderaUrl,
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {}
