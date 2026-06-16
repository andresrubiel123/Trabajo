package com.golsaint.modules.pais.entity;

import com.golsaint.shared.entity.BaseEntity;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
import lombok.*;

/**
 * Entidad MongoDB para la colección paises.
 */
/**
 * Clase Pais.
 *
 * @author Rubiel Andrés Díaz
 */

@Document(collection = "paises")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Pais extends BaseEntity {

    @Id
    private Long id;

    private String codigo;

    private String nombre;

    @Field("bandera_url")
    private String banderaUrl;
}
