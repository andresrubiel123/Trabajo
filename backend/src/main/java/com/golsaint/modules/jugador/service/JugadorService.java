package com.golsaint.modules.jugador.service;

import com.golsaint.modules.equipo.entity.Equipo;
import com.golsaint.modules.equipo.repository.EquipoRepository;
import com.golsaint.modules.jugador.dto.JugadorRequest;
import com.golsaint.modules.jugador.dto.JugadorResponse;
import com.golsaint.modules.jugador.entity.Jugador;
import com.golsaint.modules.jugador.mapper.JugadorMapper;
import com.golsaint.modules.jugador.repository.JugadorRepository;
import com.golsaint.shared.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Servicio de negocio para gestionar jugadores.
 */
/**
 * Servicio que define la lógica de negocio para Jugador.
 *
 * @author Rubiel Andrés Díaz
 */

@Service
@RequiredArgsConstructor
public class JugadorService {

    private final JugadorRepository jugadorRepository;
    private final EquipoRepository equipoRepository;

    @Transactional(readOnly = true)
    public Page<JugadorResponse> getJugadores(Pageable pageable) {
        return jugadorRepository.findAll(pageable).map(JugadorMapper::toResponse);
    }

    @Transactional(readOnly = true)
    public Page<JugadorResponse> getJugadoresByEquipo(Long equipoId, Pageable pageable) {
        return jugadorRepository.findByEquipoId(equipoId, pageable).map(JugadorMapper::toResponse);
    }

    @Transactional(readOnly = true)
    public JugadorResponse getJugadorById(Long id) {
        return jugadorRepository.findById(id)
                .map(JugadorMapper::toResponse)
                .orElseThrow(() -> new ResourceNotFoundException("Jugador no encontrado con ID: " + id));
    }

    @Transactional
    public JugadorResponse createJugador(JugadorRequest request) {
        Equipo equipo = null;
        if (request.equipoId() != null) {
            equipo = equipoRepository.findById(request.equipoId())
                    .orElseThrow(() -> new ResourceNotFoundException("Equipo no encontrado con ID: " + request.equipoId()));
        }
        Jugador jugador = Jugador.builder()
                .nombre(request.nombre())
                .edad(request.edad())
                .equipo(equipo)
                .velocidad(request.velocidad() != null ? request.velocidad() : 0)
                .definicion(request.definicion() != null ? request.definicion() : 0)
                .pase(request.pase() != null ? request.pase() : 0)
                .regate(request.regate() != null ? request.regate() : 0)
                .defensa(request.defensa() != null ? request.defensa() : 0)
                .fisico(request.fisico() != null ? request.fisico() : 0)
                .ratingGeneral(request.ratingGeneral() != null ? request.ratingGeneral() : 0)
                .build();
        Jugador saved = jugadorRepository.save(jugador);
        return JugadorMapper.toResponse(saved);
    }
}
