package com.golsaint.modules.liga.service;

import com.golsaint.modules.liga.dto.LigaRequest;
import com.golsaint.modules.liga.dto.LigaResponse;
import com.golsaint.modules.liga.entity.Liga;
import com.golsaint.modules.liga.mapper.LigaMapper;
import com.golsaint.modules.liga.repository.LigaRepository;
import com.golsaint.modules.pais.entity.Pais;
import com.golsaint.modules.pais.repository.PaisRepository;
import com.golsaint.shared.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Servicio de negocio para gestionar ligas.
 */
/**
 * Servicio que define la lógica de negocio para Liga.
 *
 * @author Rubiel Andrés Díaz
 */

@Service
@RequiredArgsConstructor
public class LigaService {

    private final LigaRepository ligaRepository;
    private final PaisRepository paisRepository;

    @Transactional(readOnly = true)
    public Page<LigaResponse> getLigas(Pageable pageable) {
        return ligaRepository.findAll(pageable).map(LigaMapper::toResponse);
    }

    @Transactional(readOnly = true)
    public LigaResponse getLigaById(Long id) {
        return ligaRepository.findById(id)
                .map(LigaMapper::toResponse)
                .orElseThrow(() -> new ResourceNotFoundException("Liga no encontrada con ID: " + id));
    }

    @Transactional
    public LigaResponse createLiga(LigaRequest request) {
        Pais pais = null;
        if (request.paisId() != null) {
            pais = paisRepository.findById(request.paisId())
                    .orElseThrow(() -> new ResourceNotFoundException("País no encontrado con ID: " + request.paisId()));
        }
        Liga liga = Liga.builder()
                .nombre(request.nombre())
                .pais(pais)
                .logoUrl(request.logoUrl())
                .build();
        Liga saved = ligaRepository.save(liga);
        return LigaMapper.toResponse(saved);
    }
}
