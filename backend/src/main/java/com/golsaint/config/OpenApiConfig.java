package com.golsaint.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Configuración de la documentación interactiva de la API con OpenAPI y Swagger UI.
 */
@Configuration
public class OpenApiConfig {

    @Bean
    public OpenAPI customOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("GOL SAINT API")
                        .version("1.0.0")
                        .description("API del backend de GOL SAINT para persistencia de datos deportivos y cuotas.")
                        .contact(new Contact()
                                .name("Rubiel Andres Diaz")));
    }
}
