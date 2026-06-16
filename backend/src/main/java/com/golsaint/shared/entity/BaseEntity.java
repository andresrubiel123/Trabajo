package com.golsaint.shared.entity;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

/**
 * Superclase para inyectar automáticamente created_at y updated_at en todas las entidades de MongoDB.
 */
@Getter
@Setter
public abstract class BaseEntity {

    @CreatedDate
    private LocalDateTime createdAt;

    @LastModifiedDate
    private LocalDateTime updatedAt;
}
