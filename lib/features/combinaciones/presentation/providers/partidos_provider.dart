/// Gestor de estado para la lista de partidos configurados.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/partido_entity.dart';

const _uuid = Uuid();

/// Provider que maneja la lista de partidos editables.
class PartidosNotifier extends Notifier<List<PartidoEntity>> {
  @override
  List<PartidoEntity> build() => [];

  /// Agrega N partidos vacíos.
  void crearPartidos(int cantidad) {
    if (cantidad < AppConstants.minPartidos ||
        cantidad > AppConstants.maxPartidos) {
      return;
    }
    state = List.generate(
      cantidad,
      (i) => PartidoEntity(
        id: _uuid.v4(),
        nombre: 'Partido ${i + 1}',
      ),
    );
  }

  /// Agrega un partido vacío al final.
  void agregarPartido() {
    if (state.length >= AppConstants.maxPartidos) return;
    state = [
      ...state,
      PartidoEntity(
        id: _uuid.v4(),
        nombre: 'Partido ${state.length + 1}',
      ),
    ];
  }

  /// Actualiza el nombre de un partido.
  void actualizarNombre(String id, String nombre) {
    state = [
      for (final p in state)
        if (p.id == id) p.copyWith(nombre: nombre) else p,
    ];
  }

  /// Fija o libera el resultado de un partido.
  void fijarResultado(String id, String? resultado) {
    state = [
      for (final p in state)
        if (p.id == id)
          resultado == null
              ? p.copyWith(clearFijo: true)
              : p.copyWith(resultadoFijo: resultado)
        else
          p,
    ];
  }

  /// Elimina un partido.
  void eliminarPartido(String id) {
    state = state.where((p) => p.id != id).toList();
  }

  /// Limpia todos los partidos.
  void limpiar() => state = [];
}

final partidosProvider =
    NotifierProvider<PartidosNotifier, List<PartidoEntity>>(
  () => PartidosNotifier(),
);
