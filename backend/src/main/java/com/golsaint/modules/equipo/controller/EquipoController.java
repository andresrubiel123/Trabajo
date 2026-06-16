package com.golsaint.modules.equipo.controller;

import com.golsaint.modules.equipo.dto.EquipoRequest;
import com.golsaint.modules.equipo.dto.EquipoResponse;
import com.golsaint.modules.equipo.service.EquipoService;
import com.golsaint.modules.jugador.dto.JugadorResponse;
import com.golsaint.modules.jugador.service.JugadorService;
import com.golsaint.shared.response.ApiResponse;
import com.golsaint.shared.response.PageResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * Controlador REST para gestionar equipos bajo api/v1.
 */
/**
 * Controlador REST para gestionar las operaciones de Equipo.
 *
 * @author Rubiel Andrés Díaz
 */

@RestController
@RequestMapping("/api/v1/equipos")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class EquipoController {

    private final EquipoService equipoService;
    private final JugadorService jugadorService;

    @GetMapping
    public ResponseEntity<ApiResponse<PageResponse<EquipoResponse>>> getEquipos(Pageable pageable) {
        PageResponse<EquipoResponse> response = PageResponse.from(equipoService.getEquipos(pageable));
        return ResponseEntity.ok(new ApiResponse<>(true, "Listado de equipos obtenido con éxito", response));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<EquipoResponse>> getEquipoById(@PathVariable Long id) {
        EquipoResponse response = equipoService.getEquipoById(id);
        return ResponseEntity.ok(new ApiResponse<>(true, "Equipo obtenido con éxito", response));
    }

    @PostMapping
    public ResponseEntity<ApiResponse<EquipoResponse>> createEquipo(@RequestBody EquipoRequest request) {
        EquipoResponse response = equipoService.createEquipo(request);
        return new ResponseEntity<>(new ApiResponse<>(true, "Equipo creado con éxito", response), HttpStatus.CREATED);
    }

    @GetMapping("/{id}/jugadores")
    public ResponseEntity<ApiResponse<PageResponse<JugadorResponse>>> getJugadoresByEquipo(@PathVariable Long id, Pageable pageable) {
        PageResponse<JugadorResponse> response = PageResponse.from(jugadorService.getJugadoresByEquipo(id, pageable));
        return ResponseEntity.ok(new ApiResponse<>(true, "Jugadores del equipo obtenidos con éxito", response));
    }
}
