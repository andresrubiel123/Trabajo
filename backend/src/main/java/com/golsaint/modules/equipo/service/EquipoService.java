package com.golsaint.modules.equipo.service;

import com.golsaint.modules.equipo.dto.EquipoRequest;
import com.golsaint.modules.equipo.dto.EquipoResponse;
import com.golsaint.modules.equipo.entity.Equipo;
import com.golsaint.modules.equipo.mapper.EquipoMapper;
import com.golsaint.modules.equipo.repository.EquipoRepository;
import com.golsaint.modules.pais.entity.Pais;
import com.golsaint.modules.pais.repository.PaisRepository;
import com.golsaint.shared.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Servicio de negocio para gestionar equipos.
 */
/**
 * Servicio que define la lógica de negocio para Equipo.
 *
 * @author Rubiel Andrés Díaz
 */

@Service
@RequiredArgsConstructor
public class EquipoService {

    private final EquipoRepository equipoRepository;
    private final PaisRepository paisRepository;

    @Transactional(readOnly = true)
    public Page<EquipoResponse> getEquipos(Pageable pageable) {
        return equipoRepository.findAll(pageable).map(EquipoMapper::toResponse);
    }

    @Transactional(readOnly = true)
    public EquipoResponse getEquipoById(Long id) {
        return equipoRepository.findById(id)
                .map(EquipoMapper::toResponse)
                .orElseThrow(() -> new ResourceNotFoundException("Equipo no encontrado con ID: " + id));
    }

    @Transactional
    public EquipoResponse createEquipo(EquipoRequest request) {
        Pais pais = null;
        if (request.paisId() != null) {
            pais = paisRepository.findById(request.paisId())
                    .orElseThrow(() -> new ResourceNotFoundException("País no encontrado con ID: " + request.paisId()));
        }
        Equipo equipo = Equipo.builder()
                .nombre(request.nombre())
                .pais(request.pais())
                .escudoUrl(request.escudoUrl())
                .ratingGeneral(request.ratingGeneral() != null ? request.ratingGeneral() : 0)
                .apiFootballDataId(request.apiFootballDataId())
                .apiSportsDbId(request.apiSportsDbId())
                .paisRel(pais)
                .build();
        Equipo saved = equipoRepository.save(equipo);
        return EquipoMapper.toResponse(saved);
    }
}
