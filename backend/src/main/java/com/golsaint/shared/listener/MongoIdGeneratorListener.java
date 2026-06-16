package com.golsaint.shared.listener;

import com.golsaint.shared.service.SequenceGeneratorService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.mongodb.core.mapping.event.BeforeConvertCallback;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;

/**
 * Listener que asigna automáticamente IDs de tipo Long autoincrementales a las entidades de MongoDB
 * cuando se van a persistir y su ID actual es nulo.
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class MongoIdGeneratorListener implements BeforeConvertCallback<Object> {

    private final SequenceGeneratorService sequenceGenerator;

    @Override
    public Object onBeforeConvert(Object entity, String collection) {
        try {
            Field idField = getField(entity.getClass(), "id");
            if (idField != null) {
                idField.setAccessible(true);
                Object currentId = idField.get(entity);
                if (currentId == null && idField.getType().equals(Long.class)) {
                    long nextId = sequenceGenerator.generateSequence(collection + "_sequence");
                    idField.set(entity, nextId);
                    log.debug("Generado ID incremental {} para la colección {}", nextId, collection);
                }
            }
        } catch (Exception e) {
            log.error("Error asignando ID autoincremental para la colección {}: {}", collection, e.getMessage());
        }
        return entity;
    }

    private Field getField(Class<?> clazz, String fieldName) {
        try {
            return clazz.getDeclaredField(fieldName);
        } catch (NoSuchFieldException e) {
            Class<?> superClass = clazz.getSuperclass();
            if (superClass != null) {
                return getField(superClass, fieldName);
            }
        }
        return null;
    }
}
