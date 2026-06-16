package com.golsaint.modules.pais.dto;

/**
 * DTO para la petición de creación/actualización de un país.
 */
public record PaisRequest(
    String codigo,
    String nombre,
    String banderaUrl
) {}
