package com.golsaint.modules.partido.dto;

import com.golsaint.modules.competicion.dto.CompeticionResponse;
import com.golsaint.modules.equipo.dto.EquipoResponse;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;

/**
 * DTO para la respuesta con datos de un partido.
 */
public record PartidoResponse(
    Long id,
    EquipoResponse equipoLocal,
    EquipoResponse equipoVisitante,
    OffsetDateTime fecha,
    String estado,
    Integer golesLocal,
    Integer golesVisitante,
    String ganador,
    CompeticionResponse competicion,
    LocalDateTime createdAt,
    LocalDateTime updatedAt
) {}
