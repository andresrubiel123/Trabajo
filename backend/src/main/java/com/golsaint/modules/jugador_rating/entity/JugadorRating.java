package com.golsaint.modules.jugador_rating.entity;

import com.golsaint.shared.entity.BaseEntity;
import com.golsaint.modules.jugador.entity.Jugador;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.DocumentReference;
import org.springframework.data.mongodb.core.mapping.Field;
import java.time.LocalDate;
import lombok.*;

/**
 * Entidad MongoDB para la colección jugador_ratings.
 */
/**
 * Clase JugadorRating.
 *
 * @author Rubiel Andrés Díaz
 */

@Document(collection = "jugador_ratings")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class JugadorRating extends BaseEntity {

    @Id
    private Long id;

    @DocumentReference
    private Jugador jugador;

    private LocalDate fecha;

    private Integer velocidad;
    private Integer definicion;
    private Integer pase;
    private Integer regate;
    private Integer defensa;
    private Integer fisico;

    @Field("rating_general")
    private Integer ratingGeneral;
}
