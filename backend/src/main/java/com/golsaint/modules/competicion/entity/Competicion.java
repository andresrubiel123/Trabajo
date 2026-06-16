package com.golsaint.modules.competicion.entity;

import com.golsaint.shared.entity.BaseEntity;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
import lombok.*;

/**
 * Entidad MongoDB para la colección competiciones.
 */
/**
 * Clase Competicion.
 *
 * @author Rubiel Andrés Díaz
 */

@Document(collection = "competiciones")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Competicion extends BaseEntity {

    @Id
    private Long id;

    private String nombre;

    private String tipo;

    @Field("logo_url")
    private String logoUrl;
}
