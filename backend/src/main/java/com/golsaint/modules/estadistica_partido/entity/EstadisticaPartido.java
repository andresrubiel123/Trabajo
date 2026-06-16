package com.golsaint.modules.estadistica_partido.entity;

import com.golsaint.shared.entity.BaseEntity;
import com.golsaint.modules.partido.entity.Partido;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.DocumentReference;
import org.springframework.data.mongodb.core.mapping.Field;
import lombok.*;

/**
 * Entidad MongoDB para la colección estadisticas_partido.
 */
/**
 * Clase EstadisticaPartido.
 *
 * @author Rubiel Andrés Díaz
 */

@Document(collection = "estadisticas_partido")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EstadisticaPartido extends BaseEntity {

    @Id
    private Long id;

    @DocumentReference
    private Partido partido;

    @Field("posesion_local")
    private Integer posesionLocal;

    @Field("posesion_visitante")
    private Integer posesionVisitante;

    @Field("tiros_local")
    private Integer tirosLocal;

    @Field("tiros_visitante")
    private Integer tirosVisitante;

    private Integer corners;
}
