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
                .doOnSuccess(r -> {
                    if (r != null && r.containsKey("teams") && r.get("teams") != null) {
                        log.info("Datos de equipo recibidos para: {}", teamName);
                    }
                })
                .doOnError(e -> {
                    if (e instanceof org.springframework.web.reactive.function.UnsupportedMediaTypeException) {
                        log.warn("No se pudo buscar el equipo {}: La API retornó HTML (probablemente por clave incorrecta o límites)", teamName);
                    } else {
                        log.error("Error buscando equipo {}: {}", teamName, e.getMessage());
                    }
                })
                .onErrorResume(e -> Mono.empty());
    }

    public Mono<Map<String, Object>> getPlayersByTeam(String teamName) {
        log.debug("Consultando jugadores del equipo: {}", teamName);
        if ("3".equals(apiKey) || "1".equals(apiKey) || apiKey == null || apiKey.trim().isEmpty()) {
            log.warn("El endpoint 'searchplayers.php?t=' requiere una API Key de Patreon (pago). Omitiendo búsqueda de jugadores para: {}", teamName);
            return Mono.empty();
        }
        return webClient.get()
                .uri("/{apiKey}/searchplayers.php?t={teamName}", apiKey, teamName)
                .retrieve()
                .bodyToMono(MAP_TYPE)
                .doOnError(e -> {
                    if (e instanceof org.springframework.web.reactive.function.UnsupportedMediaTypeException) {
                        log.warn("No se pudieron buscar jugadores para {}: La API retornó HTML (probablemente por restricción de API Key o Patreon)", teamName);
                    } else {
                        log.error("Error buscando jugadores de {}: {}", teamName, e.getMessage());
                    }
                })
                .onErrorResume(e -> Mono.empty());
    }

    public Mono<Map<String, Object>> getLeaguesByCountry(String country) {
        log.debug("Consultando ligas del país: {}", country);
        return webClient.get()
                .uri("/{apiKey}/search_all_leagues.php?c={country}", apiKey, country)
                .retrieve()
                .bodyToMono(MAP_TYPE)
                .doOnError(e -> {
                    if (e instanceof org.springframework.web.reactive.function.UnsupportedMediaTypeException) {
                        log.warn("No se pudieron buscar ligas para el país {}: La API retornó HTML", country);
                    } else {
                        log.error("Error buscando ligas de {}: {}", country, e.getMessage());
                    }
                })
                .onErrorResume(e -> Mono.empty());
    }

    public Mono<Map<String, Object>> searchPlayer(String playerName) {
        log.debug("Buscando jugador en TheSportsDB: {}", playerName);
        return webClient.get()
                .uri("/{apiKey}/searchplayers.php?p={playerName}", apiKey, playerName)
                .retrieve()
                .bodyToMono(MAP_TYPE)
                .doOnError(e -> {
                    if (e instanceof org.springframework.web.reactive.function.UnsupportedMediaTypeException) {
                        log.warn("No se pudo buscar el jugador {}: La API retornó HTML", playerName);
                    } else {
                        log.error("Error buscando jugador {}: {}", playerName, e.getMessage());
                    }
                })
                .onErrorResume(e -> Mono.empty());
    }
}
