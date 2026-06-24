/// Repositorio local para ligas almacenadas en Isar.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
library;

import 'package:isar/isar.dart';
import '../schemas/liga_schema.dart';

/// Proporciona operaciones CRUD sobre la colección [LigaSchema] en Isar.
class LigaLocalRepository {
  /// Constructor del repositorio.
  ///
  /// Parámetros:
  /// - [isar]: instancia de Isar inyectada desde [IsarService].
  const LigaLocalRepository(this._isar);

  final Isar _isar;

  /// Retorna todas las ligas ordenadas por nombre.
  Future<List<LigaSchema>> findAll() {
    return _isar.ligaSchemas
        .where()
        .sortByNombre()
        .findAll();
  }

  /// Retorna la liga con el [externalId] dado, o null si no existe.
  Future<LigaSchema?> findByExternalId(int externalId) {
    return _isar.ligaSchemas
        .filter()
        .externalIdEqualTo(externalId)
        .findFirst();
  }

  /// Retorna las ligas cuyos IDs externos están en [ids].
  Future<List<LigaSchema>> findByIds(List<int> ids) {
    return _isar.ligaSchemas
        .filter()
        .anyOf(ids, (q, id) => q.externalIdEqualTo(id))
        .findAll();
  }

  /// Inserta o actualiza todas las ligas de la lista.
  ///
  /// Utiliza el índice único [externalId] con la estrategia [replace: true]
  /// para garantizar el comportamiento UPSERT.
  Future<void> upsertAll(List<LigaSchema> ligas) async {
    await _isar.writeTxn(() async {
      await _isar.ligaSchemas.putAll(ligas);
    });
  }

  /// Retorna el número total de ligas almacenadas.
  Future<int> count() {
    return _isar.ligaSchemas.count();
  }
}
