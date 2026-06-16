package com.golsaint.modules.jugador.entity;

import com.golsaint.shared.entity.BaseEntity;
import com.golsaint.modules.equipo.entity.Equipo;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.DocumentReference;
import org.springframework.data.mongodb.core.mapping.Field;
import lombok.*;

/**
 * Entidad MongoDB para la colección jugadores.
 */
/**
 * Clase Jugador.
 *
 * @author Rubiel Andrés Díaz
 */

@Document(collection = "jugadores")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Jugador extends BaseEntity {

    @Id
    private Long id;

    private String nombre;

    private Integer edad;

    @DocumentReference
    private Equipo equipo;

    private Integer velocidad;
    private Integer definicion;
    private Integer pase;
    private Integer regate;
    private Integer defensa;
    private Integer fisico;

    @Field("rating_general")
    private Integer ratingGeneral;
}
