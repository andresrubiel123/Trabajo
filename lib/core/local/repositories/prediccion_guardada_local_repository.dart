/// Repositorio local para predicciones guardadas temporalmente en Isar.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
library;

import 'package:isar/isar.dart';
import '../schemas/prediccion_guardada_schema.dart';

/// Proporciona operaciones CRUD sobre la colección [PrediccionGuardadaSchema].
///
/// Las predicciones tienen un TTL de 24 horas — se purgan automáticamente
/// al llamar [purgarExpiradas].
class PrediccionGuardadaLocalRepository {
  /// Constructor del repositorio.
  ///
  /// Parámetros:
  /// - [isar]: instancia de Isar inyectada desde [IsarService].
  const PrediccionGuardadaLocalRepository(this._isar);

  final Isar _isar;

  /// Retorna todas las predicciones guardadas que aún no han expirado.
  Future<List<PrediccionGuardadaSchema>> findAll() {
    final ahora = DateTime.now();
    return _isar.prediccionGuardadaSchemas
        .filter()
        .expiraEnGreaterThan(ahora)
        .sortByGuardadaEnDesc()
        .findAll();
  }

  /// Retorna la predicción guardada para un partido específico, si existe.
  ///
  /// Parámetros:
  /// - [fixtureId]: ID externo del partido.
  Future<PrediccionGuardadaSchema?> findByFixture(int fixtureId) {
    return _isar.prediccionGuardadaSchemas
        .filter()
        .fixtureIdEqualTo(fixtureId)
        .findFirst();
  }

  /// Guarda o actualiza una predicción.
  ///
  /// Parámetros:
  /// - [prediccion]: objeto con todos los datos de la predicción.
  Future<void> guardar(PrediccionGuardadaSchema prediccion) async {
    await _isar.writeTxn(() async {
      await _isar.prediccionGuardadaSchemas.put(prediccion);
    });
  }

  /// Elimina una predicción por su [isarId].
  ///
  /// Parámetros:
  /// - [isarId]: ID interno de Isar.
  Future<void> eliminar(int isarId) async {
    await _isar.writeTxn(() async {
      await _isar.prediccionGuardadaSchemas.delete(isarId);
    });
  }

  /// Elimina todas las predicciones cuyo [expiraEn] es anterior a ahora.
  ///
  /// Debe llamarse al iniciar la app para limpiar predicciones expiradas
  /// y liberar espacio en Isar.
  Future<int> purgarExpiradas() async {
    final ahora = DateTime.now();
    final expiradas = await _isar.prediccionGuardadaSchemas
        .filter()
        .expiraEnLessThan(ahora)
        .findAll();

    if (expiradas.isEmpty) return 0;

    final ids = expiradas.map((p) => p.isarId).toList();
    await _isar.writeTxn(() async {
      await _isar.prediccionGuardadaSchemas.deleteAll(ids);
    });
    return ids.length;
  }

  /// Retorna el número de predicciones activas (no expiradas).
  Future<int> countActivas() {
    final ahora = DateTime.now();
    return _isar.prediccionGuardadaSchemas
        .filter()
        .expiraEnGreaterThan(ahora)
        .count();
  }
}
