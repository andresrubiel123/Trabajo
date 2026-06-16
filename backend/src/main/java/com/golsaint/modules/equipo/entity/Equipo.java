package com.golsaint.modules.equipo.entity;

import com.golsaint.shared.entity.BaseEntity;
import com.golsaint.modules.pais.entity.Pais;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.DocumentReference;
import org.springframework.data.mongodb.core.mapping.Field;
import lombok.*;

/**
 * Entidad MongoDB para la colección equipos.
 */
/**
 * Clase Equipo.
 *
 * @author Rubiel Andrés Díaz
 */

@Document(collection = "equipos")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Equipo extends BaseEntity {

    @Id
    private Long id;

    private String nombre;

    private String pais;

    @Field("escudo_url")
    private String escudoUrl;

    @Field("rating_general")
    private Integer ratingGeneral;

    @Field("api_football_data_id")
    private Integer apiFootballDataId;

    @Field("api_sportsdb_id")
    private Integer apiSportsDbId;

    @DocumentReference
    private Pais paisRel;
}
