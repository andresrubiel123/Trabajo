package com.golsaint;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.data.mongodb.config.EnableMongoAuditing;
import org.springframework.scheduling.annotation.EnableScheduling;
import com.golsaint.config.ApiConfig;

/**
 * Punto de entrada principal de GOL SAINT Backend.
 */
/**
 * Clase GolSaintApplication.
 *
 * @author Rubiel Andrés Díaz
 */

@SpringBootApplication
@EnableScheduling
@EnableMongoAuditing
@EnableConfigurationProperties(ApiConfig.class)
public class GolSaintApplication {

    public static void main(String[] args) {
        SpringApplication.run(GolSaintApplication.class, args);
    }
}
