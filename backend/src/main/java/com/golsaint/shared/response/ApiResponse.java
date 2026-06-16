package com.golsaint.shared.response;

import java.time.LocalDateTime;

/**
 * Representa la envoltura estándar para todas las respuestas REST de objeto único.
 */
public record ApiResponse<T>(
    boolean success,
    String message,
    T data,
    LocalDateTime timestamp
) {
    public ApiResponse(boolean success, String message, T data) {
        this(success, message, data, LocalDateTime.now());
    }
}
