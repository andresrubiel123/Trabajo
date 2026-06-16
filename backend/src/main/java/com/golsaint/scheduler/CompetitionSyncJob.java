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

    public Competicion getOrCreateCompeticion(ApiConfig.FootballData.Competicion configComp) {
        return competicionRepository.findByNombre(configComp.getNombre()).orElseGet(() -> {
            log.info("Creando nueva competición: {}", configComp.getNombre());
            Competicion competicion = Competicion.builder()
                    .nombre(configComp.getNombre())
                    .tipo(configComp.getTipo())
                    .logoUrl(null)
                    .build();
            return competicionRepository.save(competicion);
        });
    }
}
