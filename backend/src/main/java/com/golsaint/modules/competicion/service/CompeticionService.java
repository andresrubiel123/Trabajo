package com.golsaint.modules.competicion.service;

import com.golsaint.modules.competicion.dto.CompeticionRequest;
import com.golsaint.modules.competicion.dto.CompeticionResponse;
import com.golsaint.modules.competicion.entity.Competicion;
import com.golsaint.modules.competicion.mapper.CompeticionMapper;
import com.golsaint.modules.competicion.repository.CompeticionRepository;
import com.golsaint.shared.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Servicio de negocio para gestionar competiciones.
 */
/**
 * Servicio que define la lógica de negocio para Competicion.
 *
 * @author Rubiel Andrés Díaz
 */

@Service
@RequiredArgsConstructor
public class CompeticionService {

    private final CompeticionRepository competicionRepository;

    @Transactional(readOnly = true)
    public Page<CompeticionResponse> getCompeticiones(Pageable pageable) {
        return competicionRepository.findAll(pageable).map(CompeticionMapper::toResponse);
    }

    @Transactional(readOnly = true)
    public CompeticionResponse getCompeticionById(Long id) {
        return competicionRepository.findById(id)
                .map(CompeticionMapper::toResponse)
                .orElseThrow(() -> new ResourceNotFoundException("Competición no encontrada con ID: " + id));
    }

    @Transactional
    public CompeticionResponse createCompeticion(CompeticionRequest request) {
        Competicion competicion = Competicion.builder()
                .nombre(request.nombre())
                .tipo(request.tipo())
                .logoUrl(request.logoUrl())
                .build();
        Competicion saved = competicionRepository.save(competicion);
        return CompeticionMapper.toResponse(saved);
    }
}
