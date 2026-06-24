/// Repositorio local para jugadores almacenados en Isar.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
library;

import 'package:isar/isar.dart';
import '../schemas/jugador_schema.dart';

/// Proporciona operaciones CRUD sobre la colección [JugadorSchema] en Isar.
class JugadorLocalRepository {
  /// Constructor del repositorio.
  ///
  /// Parámetros:
  /// - [isar]: instancia de Isar inyectada desde [IsarService].
  const JugadorLocalRepository(this._isar);

  final Isar _isar;

  /// Retorna todos los jugadores de un equipo ordenados por apellido.
  ///
  /// Parámetros:
  /// - [equipoId]: ID externo del equipo.
  Future<List<JugadorSchema>> findByEquipo(int equipoId) {
    return _isar.jugadorSchemas
        .filter()
        .equipoIdEqualTo(equipoId)
        .sortByApellido()
        .findAll();
  }

  /// Retorna el jugador con el [externalId] dado, o null si no existe.
  Future<JugadorSchema?> findByExternalId(int externalId) {
    return _isar.jugadorSchemas
        .filter()
        .externalIdEqualTo(externalId)
        .findFirst();
  }

  /// Inserta o actualiza todos los jugadores de la lista.
  ///
  /// Usa el índice único [externalId] con [replace: true] para UPSERT.
  Future<void> upsertAll(List<JugadorSchema> jugadores) async {
    await _isar.writeTxn(() async {
      await _isar.jugadorSchemas.putAll(jugadores);
    });
  }
}
