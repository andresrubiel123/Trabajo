package com.golsaint.modules.liga.dto;

import com.golsaint.modules.pais.dto.PaisResponse;
import java.time.LocalDateTime;

/**
 * DTO para la respuesta con datos de una liga.
 */
public record LigaResponse(
    Long id,
    String nombre,
    PaisResponse pais,
    String logoUrl,
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {}
