package com.golsaint.modules.cuota.entity;

import com.golsaint.shared.entity.BaseEntity;
import com.golsaint.modules.partido.entity.Partido;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.DocumentReference;
import org.springframework.data.mongodb.core.mapping.Field;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import lombok.*;

/**
 * Entidad MongoDB para la colección cuotas.
 */
/**
 * Clase Cuota.
 *
 * @author Rubiel Andrés Díaz
 */

@Document(collection = "cuotas")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Cuota extends BaseEntity {

    @Id
    private Long id;

    @DocumentReference
    private Partido partido;

    private BigDecimal local;

    private BigDecimal empate;

    private BigDecimal visitante;

    @Field("casa_apuesta")
    private String casaApuesta;

    @Field("fecha_actualizacion")
    private LocalDateTime fechaActualizacion;
}
