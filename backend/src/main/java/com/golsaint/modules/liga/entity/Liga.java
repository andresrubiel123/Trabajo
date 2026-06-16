package com.golsaint.modules.liga.entity;

import com.golsaint.shared.entity.BaseEntity;
import com.golsaint.modules.pais.entity.Pais;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.DocumentReference;
import org.springframework.data.mongodb.core.mapping.Field;
import lombok.*;

/**
 * Entidad MongoDB para la colección ligas.
 */
/**
 * Clase Liga.
 *
 * @author Rubiel Andrés Díaz
 */

@Document(collection = "ligas")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Liga extends BaseEntity {

    @Id
    private Long id;

    private String nombre;

    @DocumentReference
    private Pais pais;

    @Field("logo_url")
    private String logoUrl;
}
