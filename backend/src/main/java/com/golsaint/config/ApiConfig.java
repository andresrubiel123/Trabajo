package com.golsaint.config;

import java.util.List;
import org.springframework.boot.context.properties.ConfigurationProperties;
import lombok.Getter;
import lombok.Setter;

/**
 * Clase de configuración que mapea las propiedades de las APIs externas.
 */
/**
 * Clase de configuración para Api.
 *
 * @author Rubiel Andrés Díaz
 */

@ConfigurationProperties(prefix = "api")
@Getter
@Setter
public class ApiConfig {

    private SportsDb sportsdb = new SportsDb();
    private FootballData footballdata = new FootballData();

    @Getter
    @Setter
    public static class SportsDb {
        private String baseUrl;
        private String apiKey;
    }

    @Getter
    @Setter
    public static class FootballData {
        private String baseUrl;
        private String apiKey;
        private List<Competicion> competitions;

        @Getter
        @Setter
        public static class Competicion {
            private String code;
            private String nombre;
            private String tipo;
        }
    }
}
