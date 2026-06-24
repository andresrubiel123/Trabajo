/// Repositorio local para equipos almacenados en Isar.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
library;

import 'package:isar/isar.dart';
import '../schemas/equipo_schema.dart';

/// Proporciona operaciones CRUD sobre la colección [EquipoSchema] en Isar.
class EquipoLocalRepository {
  /// Constructor del repositorio.
  ///
  /// Parámetros:
  /// - [isar]: instancia de Isar inyectada desde [IsarService].
  const EquipoLocalRepository(this._isar);

  final Isar _isar;

  /// Retorna todos los equipos de una liga ordenados por nombre.
  ///
  /// Parámetros:
  /// - [ligaId]: ID externo de la liga.
  Future<List<EquipoSchema>> findByLiga(int ligaId) {
    return _isar.equipoSchemas
        .filter()
        .ligaIdEqualTo(ligaId)
        .sortByNombre()
        .findAll();
  }

  /// Retorna el equipo con el [externalId] dado, o null si no existe.
  Future<EquipoSchema?> findByExternalId(int externalId) {
    return _isar.equipoSchemas
        .filter()
        .externalIdEqualTo(externalId)
        .findFirst();
  }

  /// Búsqueda de equipos por nombre (case-insensitive, contiene).
  ///
  /// Parámetros:
  /// - [query]: texto a buscar en el nombre del equipo.
  Future<List<EquipoSchema>> buscar(String query) {
    return _isar.equipoSchemas
        .filter()
        .nombreContains(query, caseSensitive: false)
        .sortByNombre()
        .findAll();
  }

  /// Retorna todos los equipos sin filtro, ordenados por nombre.
  Future<List<EquipoSchema>> findAll() {
    return _isar.equipoSchemas.where().sortByNombre().findAll();
  }

  /// Inserta o actualiza todos los equipos de la lista.
  ///
  /// Usa el índice único [externalId] con [replace: true] para UPSERT.
  Future<void> upsertAll(List<EquipoSchema> equipos) async {
    await _isar.writeTxn(() async {
      await _isar.equipoSchemas.putAll(equipos);
    });
  }
}
