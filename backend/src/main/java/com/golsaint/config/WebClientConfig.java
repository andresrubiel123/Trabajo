package com.golsaint.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.client.WebClient;

/**
 * Configuración global de WebClient para servicios externos.
 */
/**
 * Clase de configuración para WebClient.
 *
 * @author Rubiel Andrés Díaz
 */

@Configuration
public class WebClientConfig {

    @Bean(name = "footballDataWebClient")
    public WebClient footballDataWebClient(ApiConfig config) {
        reactor.netty.http.client.HttpClient httpClient = reactor.netty.http.client.HttpClient.create()
                .keepAlive(false) // Desactiva pooling para evitar PrematureCloseException
                .responseTimeout(java.time.Duration.ofSeconds(15));

        return WebClient.builder()
                .baseUrl(config.getFootballdata().getBaseUrl())
                .defaultHeader("X-Auth-Token", config.getFootballdata().getApiKey())
                .defaultHeader("Connection", "close") // Indicar que cierre la conexión al terminar
                .codecs(configurer -> configurer.defaultCodecs().maxInMemorySize(10 * 1024 * 1024)) // 10MB de buffer
                .clientConnector(new org.springframework.http.client.reactive.ReactorClientHttpConnector(httpClient))
                .build();
    }

    @Bean(name = "sportsDbWebClient")
    public WebClient sportsDbWebClient(ApiConfig config) {
        reactor.netty.http.client.HttpClient httpClient = reactor.netty.http.client.HttpClient.create()
                .keepAlive(false) // Desactiva pooling para evitar PrematureCloseException
                .responseTimeout(java.time.Duration.ofSeconds(15));

        return WebClient.builder()
                .baseUrl(config.getSportsdb().getBaseUrl())
                .defaultHeader("Connection", "close")
                .codecs(configurer -> configurer.defaultCodecs().maxInMemorySize(10 * 1024 * 1024)) // 10MB de buffer
                .clientConnector(new org.springframework.http.client.reactive.ReactorClientHttpConnector(httpClient))
                .build();
    }


}
