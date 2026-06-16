package com.golsaint.modules.partido.entity;

import com.golsaint.shared.entity.BaseEntity;
import com.golsaint.modules.equipo.entity.Equipo;
import com.golsaint.modules.competicion.entity.Competicion;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.DocumentReference;
import org.springframework.data.mongodb.core.mapping.Field;
import java.time.OffsetDateTime;
import lombok.*;

/**
 * Entidad MongoDB para la colección partidos.
 */
/**
 * Clase Partido.
 *
 * @author Rubiel Andrés Díaz
 */

@Document(collection = "partidos")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Partido extends BaseEntity {

    @Id
    private Long id;

    @DocumentReference
    @Field("equipo_local")
    private Equipo equipoLocal;

    @DocumentReference
    @Field("equipo_visitante")
    private Equipo equipoVisitante;

    private OffsetDateTime fecha;

    private String estado;

    @Field("goles_local")
    private Integer golesLocal;

    @Field("goles_visitante")
    private Integer golesVisitante;

    private String ganador;

    @DocumentReference
    private Competicion competicion;
}
