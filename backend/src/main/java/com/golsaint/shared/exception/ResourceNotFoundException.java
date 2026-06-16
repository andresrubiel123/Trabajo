package com.golsaint.shared.exception;

/**
 * Excepción lanzada cuando un recurso solicitado no se encuentra.
 */
/**
 * Excepción personalizada para controlar errores de ResourceNotFound.
 *
 * @author Rubiel Andrés Díaz
 */

public class ResourceNotFoundException extends BusinessException {
    public ResourceNotFoundException(String message) {
        super(message);
    }
}
