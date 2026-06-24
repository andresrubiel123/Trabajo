package com.golsaint.scheduler;

import com.golsaint.config.ApiConfig;
import com.golsaint.modules.competicion.entity.Competicion;
import com.golsaint.modules.competicion.repository.CompeticionRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * Job para sincronizar competiciones base configuradas en el sistema.
 */
/**
 * Tarea programada para sincronizar datos de CompetitionSync.
 *
 * @author Rubiel Andrés Díaz
 */

@Slf4j
@Component
@RequiredArgsConstructor
public class CompetitionSyncJob {

    private final CompeticionRepository competicionRepository;

    public Competicion getOrCreateCompeticion(ApiConfig.FootballData.Competicion configComp, String logoUrl) {
        Competicion competicion = competicionRepository.findByNombre(configComp.getNombre()).orElse(null);
        if (competicion == null) {
            log.info("Creando nueva competición: {}", configComp.getNombre());
            competicion = Competicion.builder()
                    .nombre(configComp.getNombre())
                    .tipo(configComp.getTipo())
                    .logoUrl(logoUrl)
                    .build();
            return competicionRepository.save(competicion);
        } else if ((competicion.getLogoUrl() == null || competicion.getLogoUrl().trim().isEmpty()) && logoUrl != null && !logoUrl.trim().isEmpty()) {
            competicion.setLogoUrl(logoUrl);
            log.info("Logotipo de competición actualizado para: {}", configComp.getNombre());
            return competicionRepository.save(competicion);
        }
        return competicion;
    }
}
