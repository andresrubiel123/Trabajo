package com.golsaint.integration.sportsdb.service;

import com.golsaint.config.ApiConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;
import java.util.Map;

/**
 * Servicio de integración con TheSportsDB API.
 * 
 * @author Rubiel Andrés Díaz
 */
@Slf4j
@Service
public class SportsDbService {

    private final WebClient webClient;
    private final String apiKey;
    private static final ParameterizedTypeReference<Map<String, Object>> MAP_TYPE = 
            new ParameterizedTypeReference<Map<String, Object>>() {};

    public SportsDbService(
            @Qualifier("sportsDbWebClient") WebClient webClient,
            ApiConfig config) {
        this.webClient = webClient;
        this.apiKey = config.getSportsdb().getApiKey();
        log.info("SportsDbService inicializado - API Key: {}", apiKey);
    }

    public Mono<Map<String, Object>> searchTeam(String teamName) {
        log.debug("Buscando equipo en TheSportsDB: {}", teamName);
        return webClient.get()
                .uri("/{apiKey}/searchteams.php?t={teamName}", apiKey, teamName)
                .retrieve()
                .bodyToMono(MAP_TYPE)
                .doOnSuccess(r -> log.info("Datos de equipo recibidos para: {}", teamName))
                .doOnError(e -> log.error("Error buscando equipo {}: {}", teamName, e.getMessage()))
                .onErrorResume(e -> Mono.empty());
    }

    public Mono<Map<String, Object>> getPlayersByTeam(String teamName) {
        log.debug("Consultando jugadores del equipo: {}", teamName);
        return webClient.get()
                .uri("/{apiKey}/searchplayers.php?t={teamName}", apiKey, teamName)
                .retrieve()
                .bodyToMono(MAP_TYPE)
                .doOnError(e -> log.error("Error buscando jugadores de {}: {}", teamName, e.getMessage()))
                .onErrorResume(e -> Mono.empty());
    }

    public Mono<Map<String, Object>> getLeaguesByCountry(String country) {
        log.debug("Consultando ligas del país: {}", country);
        return webClient.get()
                .uri("/{apiKey}/search_all_leagues.php?c={country}", apiKey, country)
                .retrieve()
                .bodyToMono(MAP_TYPE)
                .doOnError(e -> log.error("Error buscando ligas de {}: {}", country, e.getMessage()))
                .onErrorResume(e -> Mono.empty());
    }

    public Mono<Map<String, Object>> searchPlayer(String playerName) {
        log.debug("Buscando jugador en TheSportsDB: {}", playerName);
        return webClient.get()
                .uri("/{apiKey}/searchplayers.php?p={playerName}", apiKey, playerName)
                .retrieve()
                .bodyToMono(MAP_TYPE)
                .doOnError(e -> log.error("Error buscando jugador {}: {}", playerName, e.getMessage()))
                .onErrorResume(e -> Mono.empty());
    }
}
