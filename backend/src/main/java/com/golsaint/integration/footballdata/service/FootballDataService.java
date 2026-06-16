package com.golsaint.integration.footballdata.service;

import com.golsaint.config.ApiConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;
import java.util.Map;

/**
 * Servicio de integración con Football-Data.org.
 * 
 * @author Rubiel Andrés Díaz
 */
@Slf4j
@Service
public class FootballDataService {

    private final WebClient webClient;
    private static final ParameterizedTypeReference<Map<String, Object>> MAP_TYPE = 
            new ParameterizedTypeReference<Map<String, Object>>() {};

    public FootballDataService(
            @Qualifier("footballDataWebClient") WebClient webClient,
            ApiConfig config) {
        this.webClient = webClient;
        log.info("FootballDataService inicializado - Base URL: {}", config.getFootballdata().getBaseUrl());
    }

    public Mono<Map<String, Object>> getMatchesByCompetition(String competitionCode) {
        log.debug("Consultando partidos de la competición: {}", competitionCode);
        return webClient.get()
                .uri("/competitions/{code}/matches", competitionCode)
                .retrieve()
                .bodyToMono(MAP_TYPE)
                .doOnSuccess(r -> log.info("Partidos recibidos para {}", competitionCode))
                .doOnError(e -> log.error("Error obteniendo partidos de {}: {}", competitionCode, e.getMessage()))
                .onErrorResume(e -> Mono.empty());
    }

    public Mono<Map<String, Object>> getStandings(String competitionCode) {
        log.debug("Consultando tabla de posiciones de: {}", competitionCode);
        return webClient.get()
                .uri("/competitions/{code}/standings", competitionCode)
                .retrieve()
                .bodyToMono(MAP_TYPE)
                .doOnError(e -> log.error("Error obteniendo tabla de {}: {}", competitionCode, e.getMessage()))
                .onErrorResume(e -> Mono.empty());
    }

    public Mono<Map<String, Object>> getTeamsByCompetition(String competitionCode) {
        log.debug("Consultando equipos de la competición: {}", competitionCode);
        return webClient.get()
                .uri("/competitions/{code}/teams", competitionCode)
                .retrieve()
                .bodyToMono(MAP_TYPE)
                .doOnError(e -> log.error("Error obteniendo equipos de {}: {}", competitionCode, e.getMessage()))
                .onErrorResume(e -> Mono.empty());
    }

    public Mono<Map<String, Object>> getTodayMatches() {
        log.debug("Consultando partidos de hoy");
        return webClient.get()
                .uri("/matches")
                .retrieve()
                .bodyToMono(MAP_TYPE)
                .doOnError(e -> log.error("Error obteniendo partidos de hoy: {}", e.getMessage()))
                .onErrorResume(e -> Mono.empty());
    }
}
