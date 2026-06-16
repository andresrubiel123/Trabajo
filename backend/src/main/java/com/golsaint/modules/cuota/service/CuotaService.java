package com.golsaint.modules.cuota.service;

import com.golsaint.modules.cuota.dto.CuotaRequest;
import com.golsaint.modules.cuota.dto.CuotaResponse;
import com.golsaint.modules.cuota.entity.Cuota;
import com.golsaint.modules.cuota.mapper.CuotaMapper;
import com.golsaint.modules.cuota.repository.CuotaRepository;
import com.golsaint.modules.partido.entity.Partido;
import com.golsaint.modules.partido.repository.PartidoRepository;
import com.golsaint.shared.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDateTime;

/**
 * Servicio de negocio para gestionar cuotas de apuestas.
 */
/**
 * Servicio que define la lógica de negocio para Cuota.
 *
 * @author Rubiel Andrés Díaz
 */

@Service
@RequiredArgsConstructor
@SuppressWarnings("null")
public class CuotaService {

    private final CuotaRepository cuotaRepository;
    private final PartidoRepository partidoRepository;

    @Transactional(readOnly = true)
    public Page<CuotaResponse> getCuotasByPartido(Long partidoId, Pageable pageable) {
        return cuotaRepository.findByPartidoId(partidoId, pageable).map(CuotaMapper::toResponse);
    }

    @Transactional
    public CuotaResponse addCuota(Long partidoId, CuotaRequest request) {
        Partido partido = partidoRepository.findById(partidoId)
                .orElseThrow(() -> new ResourceNotFoundException("Partido no encontrado con ID: " + partidoId));
        
        Cuota cuota = Cuota.builder()
                .partido(partido)
                .local(request.local())
                .empate(request.empate())
                .visitante(request.visitante())
                .casaApuesta(request.casaApuesta())
                .fechaActualizacion(LocalDateTime.now())
                .build();
        
        Cuota saved = cuotaRepository.save(cuota);
        return CuotaMapper.toResponse(saved);
    }
}
