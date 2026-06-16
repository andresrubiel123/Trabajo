package com.golsaint.shared.service;

import com.golsaint.shared.entity.DatabaseSequence;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import static org.springframework.data.mongodb.core.FindAndModifyOptions.options;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Query.query;

/**
 * Servicio para generar secuencias numéricas atómicas en MongoDB.
 */
@Service
public class SequenceGeneratorService {

    private final MongoOperations mongoOperations;

    public SequenceGeneratorService(@Lazy MongoOperations mongoOperations) {
        this.mongoOperations = mongoOperations;
    }

    /**
     * Incrementa la secuencia atómicamente y devuelve el siguiente valor.
     * 
     * @param seqName Nombre de la secuencia.
     * @return El siguiente valor numérico.
     */
    public long generateSequence(String seqName) {
        DatabaseSequence counter = mongoOperations.findAndModify(
                query(where("_id").is(seqName)),
                new Update().inc("seq", 1),
                options().returnNew(true).upsert(true),
                DatabaseSequence.class
        );
        return counter != null ? counter.getSeq() : 1;
    }
}
