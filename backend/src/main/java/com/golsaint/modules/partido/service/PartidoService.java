package com.golsaint.modules.partido.service;

import com.golsaint.modules.competicion.entity.Competicion;
import com.golsaint.modules.competicion.repository.CompeticionRepository;
import com.golsaint.modules.equipo.entity.Equipo;
import com.golsaint.modules.equipo.repository.EquipoRepository;
import com.golsaint.modules.partido.dto.PartidoRequest;
import com.golsaint.modules.partido.dto.PartidoResponse;
import com.golsaint.modules.partido.entity.Partido;
import com.golsaint.modules.partido.mapper.PartidoMapper;
import com.golsaint.modules.partido.repository.PartidoRepository;
import com.golsaint.shared.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Servicio de negocio para gestionar partidos.
 */
/**
 * Servicio que define la lógica de negocio para Partido.
 *
 * @author Rubiel Andrés Díaz
 */

@Service
@RequiredArgsConstructor
@SuppressWarnings("null")
public class PartidoService {

    private final PartidoRepository partidoRepository;
    private final EquipoRepository equipoRepository;
    private final CompeticionRepository competicionRepository;

    @Transactional(readOnly = true)
    public Page<PartidoResponse> getPartidos(Pageable pageable) {
        return partidoRepository.findAll(pageable).map(PartidoMapper::toResponse);
    }

    @Transactional(readOnly = true)
    public Page<PartidoResponse> getPartidosByCompeticion(Long competicionId, Pageable pageable) {
        return partidoRepository.findByCompeticionId(competicionId, pageable).map(PartidoMapper::toResponse);
    }

    @Transactional(readOnly = true)
    public PartidoResponse getPartidoById(Long id) {
        return partidoRepository.findById(id)
                .map(PartidoMapper::toResponse)
                .orElseThrow(() -> new ResourceNotFoundException("Partido no encontrado con ID: " + id));
    }

    @Transactional
    public PartidoResponse createPartido(PartidoRequest request) {
        Equipo local = equipoRepository.findById(request.equipoLocalId())
                .orElseThrow(() -> new ResourceNotFoundException("Equipo local no encontrado con ID: " + request.equipoLocalId()));
        Equipo visitante = equipoRepository.findById(request.equipoVisitanteId())
                .orElseThrow(() -> new ResourceNotFoundException("Equipo visitante no encontrado con ID: " + request.equipoVisitanteId()));
        
        Competicion comp = null;
        if (request.competicionId() != null) {
            comp = competicionRepository.findById(request.competicionId())
                    .orElseThrow(() -> new ResourceNotFoundException("Competición no encontrada con ID: " + request.competicionId()));
        }

        Partido partido = Partido.builder()
                .equipoLocal(local)
                .equipoVisitante(visitante)
                .fecha(request.fecha())
                .estado(request.estado())
                .competicion(comp)
                .build();
        
        Partido saved = partidoRepository.save(partido);
        return PartidoMapper.toResponse(saved);
    }
}
