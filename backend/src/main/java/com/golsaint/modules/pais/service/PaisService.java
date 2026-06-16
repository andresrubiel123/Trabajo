package com.golsaint.modules.pais.service;

import com.golsaint.modules.pais.dto.PaisRequest;
import com.golsaint.modules.pais.dto.PaisResponse;
import com.golsaint.modules.pais.entity.Pais;
import com.golsaint.modules.pais.mapper.PaisMapper;
import com.golsaint.modules.pais.repository.PaisRepository;
import com.golsaint.shared.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Servicio de negocio para gestionar países.
 */
/**
 * Servicio que define la lógica de negocio para Pais.
 *
 * @author Rubiel Andrés Díaz
 */

@Service
@RequiredArgsConstructor
@SuppressWarnings("null")
public class PaisService {

    private final PaisRepository paisRepository;

    @Transactional(readOnly = true)
    public Page<PaisResponse> getPaises(Pageable pageable) {
        return paisRepository.findAll(pageable).map(PaisMapper::toResponse);
    }

    @Transactional(readOnly = true)
    public PaisResponse getPaisById(Long id) {
        return paisRepository.findById(id)
                .map(PaisMapper::toResponse)
                .orElseThrow(() -> new ResourceNotFoundException("País no encontrado con ID: " + id));
    }

    @Transactional
    public PaisResponse createPais(PaisRequest request) {
        Pais pais = PaisMapper.toEntity(request);
        Pais saved = paisRepository.save(pais);
        return PaisMapper.toResponse(saved);
    }
}
