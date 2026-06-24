package com.golsaint.modules.estadistica_partido.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.golsaint.modules.estadistica_partido.dto.EstadisticaPartidoRequest;
import com.golsaint.modules.estadistica_partido.dto.EstadisticaPartidoResponse;
import com.golsaint.modules.estadistica_partido.entity.EstadisticaPartido;
import com.golsaint.modules.estadistica_partido.mapper.EstadisticaPartidoMapper;
import com.golsaint.modules.estadistica_partido.repository.EstadisticaPartidoRepository;
import com.golsaint.modules.partido.entity.Partido;
import com.golsaint.modules.partido.repository.PartidoRepository;
import com.golsaint.shared.exception.ResourceNotFoundException;

import lombok.RequiredArgsConstructor;

/**
 * Servicio de negocio para gestionar estadísticas de partidos.
 */
/**
 * Servicio que define la lógica de negocio para EstadisticaPartido.
 *
 * @author Rubiel Andrés Díaz
 */

@Service
@RequiredArgsConstructor
public class EstadisticaPartidoService {

    private final EstadisticaPartidoRepository estadisticaPartidoRepository;
    private final PartidoRepository partidoRepository;

    @Transactional(readOnly = true)
    public EstadisticaPartidoResponse getEstadisticasByPartido(Long partidoId) {
        return estadisticaPartidoRepository.findByPartidoId(partidoId)
                .map(EstadisticaPartidoMapper::toResponse)
                .orElseThrow(() -> new ResourceNotFoundException("Estadísticas no encontradas para el partido: " + partidoId));
    }

    @Transactional
    public EstadisticaPartidoResponse updateEstadisticas(Long partidoId, EstadisticaPartidoRequest request) {
        EstadisticaPartido stats = estadisticaPartidoRepository.findByPartidoId(partidoId)
                .orElseGet(() -> {
                    Partido partido = partidoRepository.findById(partidoId)
                            .orElseThrow(() -> new ResourceNotFoundException("Partido no encontrado: " + partidoId));
                    return EstadisticaPartido.builder().partido(partido).build();
                });
        
        if (request.posesionLocal() != null) stats.setPosesionLocal(request.posesionLocal());
        if (request.posesionVisitante() != null) stats.setPosesionVisitante(request.posesionVisitante());
        if (request.tirosLocal() != null) stats.setTirosLocal(request.tirosLocal());
        if (request.tirosVisitante() != null) stats.setTirosVisitante(request.tirosVisitante());
        if (request.corners() != null) stats.setCorners(request.corners());
        
        EstadisticaPartido saved = estadisticaPartidoRepository.save(stats);
        return EstadisticaPartidoMapper.toResponse(saved);
    }
}
