package com.golsaint.shared.exception;

/**
 * Excepción base para los errores de lógica de negocio del proyecto GOL SAINT.
 */
/**
 * Excepción personalizada para controlar errores de Business.
 *
 * @author Rubiel Andrés Díaz
 */

public class BusinessException extends RuntimeException {
    public BusinessException(String message) {
        super(message);
    }
}
