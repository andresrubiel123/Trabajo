package com.golsaint.modules.competicion.dto;

import java.time.LocalDateTime;

/**
 * DTO para la respuesta con datos de una competición.
 */
public record CompeticionResponse(
    Long id,
    String nombre,
    String tipo,
    String logoUrl,
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {}
