package com.golsaint.modules.jugador_rating.service;

import com.golsaint.modules.jugador.entity.Jugador;
import com.golsaint.modules.jugador.repository.JugadorRepository;
import com.golsaint.modules.jugador_rating.dto.JugadorRatingRequest;
import com.golsaint.modules.jugador_rating.dto.JugadorRatingResponse;
import com.golsaint.modules.jugador_rating.entity.JugadorRating;
import com.golsaint.modules.jugador_rating.mapper.JugadorRatingMapper;
import com.golsaint.modules.jugador_rating.repository.JugadorRatingRepository;
import com.golsaint.shared.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Servicio de negocio para gestionar el histórico de ratings de los jugadores.
 */
/**
 * Servicio que define la lógica de negocio para JugadorRating.
 *
 * @author Rubiel Andrés Díaz
 */

@Service
@RequiredArgsConstructor
public class JugadorRatingService {

    private final JugadorRatingRepository jugadorRatingRepository;
    private final JugadorRepository jugadorRepository;

    @Transactional(readOnly = true)
    public Page<JugadorRatingResponse> getRatingsByJugador(Long jugadorId, Pageable pageable) {
        return jugadorRatingRepository.findByJugadorIdOrderByFechaDesc(jugadorId, pageable)
                .map(JugadorRatingMapper::toResponse);
    }

    @Transactional
    public JugadorRatingResponse addRating(Long jugadorId, JugadorRatingRequest request) {
        Jugador jugador = jugadorRepository.findById(jugadorId)
                .orElseThrow(() -> new ResourceNotFoundException("Jugador no encontrado con ID: " + jugadorId));
        
        JugadorRating rating = JugadorRating.builder()
                .jugador(jugador)
                .fecha(request.fecha())
                .velocidad(request.velocidad() != null ? request.velocidad() : 0)
                .definicion(request.definicion() != null ? request.definicion() : 0)
                .pase(request.pase() != null ? request.pase() : 0)
                .regate(request.regate() != null ? request.regate() : 0)
                .defensa(request.defensa() != null ? request.defensa() : 0)
                .fisico(request.fisico() != null ? request.fisico() : 0)
                .ratingGeneral(request.ratingGeneral() != null ? request.ratingGeneral() : 0)
                .build();
        
        JugadorRating saved = jugadorRatingRepository.save(rating);
        return JugadorRatingMapper.toResponse(saved);
    }
}
