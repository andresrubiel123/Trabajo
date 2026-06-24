/// Repositorio local para partidos recientes almacenados en Isar.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
/// Actualizado: 2026-06-24 — Métodos para Copa del Mundo 2026.
library;

import 'package:isar/isar.dart';
import '../schemas/partido_local_schema.dart';

/// Proporciona operaciones CRUD sobre la colección [PartidoLocalSchema] en Isar.
class PartidoLocalRepository {
  /// Constructor del repositorio.
  ///
  /// Parámetros:
  /// - [isar]: instancia de Isar inyectada desde [IsarService].
  const PartidoLocalRepository(this._isar);

  final Isar _isar;

  /// Retorna los partidos más recientes ordenados por fecha descendente.
  ///
  /// Parámetros:
  /// - [limit]: número máximo de partidos a retornar (por defecto 50).
  Future<List<PartidoLocalSchema>> findRecientes({int limit = 50}) {
    return _isar.partidoLocalSchemas
        .where()
        .sortByFechaDesc()
        .limit(limit)
        .findAll();
  }

  /// Retorna los partidos de una liga ordenados por fecha descendente.
  ///
  /// Parámetros:
  /// - [ligaId]: ID externo de la liga.
  /// - [limit]: máximo de partidos a retornar (por defecto 100).
  Future<List<PartidoLocalSchema>> findByLiga(int ligaId, {int limit = 100}) {
    return _isar.partidoLocalSchemas
        .filter()
        .ligaIdEqualTo(ligaId)
        .sortByFechaDesc()
        .limit(limit)
        .findAll();
  }

  /// Retorna los partidos de una fecha específica.
  ///
  /// Parámetros:
  /// - [fecha]: fecha del día a consultar (solo año/mes/día).
  Future<List<PartidoLocalSchema>> findByFecha(DateTime fecha) {
    final inicio = DateTime(fecha.year, fecha.month, fecha.day);
    final fin = inicio.add(const Duration(days: 1));
    return _isar.partidoLocalSchemas
        .filter()
        .fechaBetween(inicio, fin)
        .sortByFecha()
        .findAll();
  }

  /// Retorna el partido con el [externalId] dado, o null si no existe.
  Future<PartidoLocalSchema?> findByExternalId(int externalId) {
    return _isar.partidoLocalSchemas
        .filter()
        .externalIdEqualTo(externalId)
        .findFirst();
  }

  /// Retorna todos los partidos de la Copa del Mundo ordenados por fecha.
  ///
  /// Parámetros:
  /// - [limit]: máximo de partidos a retornar (por defecto 64 — todos del mundial).
  Future<List<PartidoLocalSchema>> findByMundial({int limit = 64}) {
    return _isar.partidoLocalSchemas
        .filter()
        .esPartidoMundialEqualTo(true)
        .sortByFecha()
        .limit(limit)
        .findAll();
  }

  /// Retorna los partidos del Mundial de una fase específica.
  ///
  /// Parámetros:
  /// - [ronda]: nombre de la ronda (ej: "Fase de Grupos", "Octavos de Final").
  Future<List<PartidoLocalSchema>> findByRonda(String ronda) {
    return _isar.partidoLocalSchemas
        .filter()
        .esPartidoMundialEqualTo(true)
        .and()
        .rondaEqualTo(ronda)
        .sortByFecha()
        .findAll();
  }

  /// Retorna los partidos del Mundial de un grupo específico.
  ///
  /// Parámetros:
  /// - [grupo]: letra del grupo (ej: "A", "B", ..., "H").
  Future<List<PartidoLocalSchema>> findByGrupo(String grupo) {
    return _isar.partidoLocalSchemas
        .filter()
        .esPartidoMundialEqualTo(true)
        .and()
        .grupoEqualTo(grupo)
        .sortByFecha()
        .findAll();
  }

  /// Retorna los próximos partidos del Mundial (estado programado, fecha >= hoy).
  ///
  /// Parámetros:
  /// - [limit]: máximo de partidos a retornar.
  Future<List<PartidoLocalSchema>> findProximosMundial({int limit = 5}) {
    final ahora = DateTime.now();
    return _isar.partidoLocalSchemas
        .filter()
        .esPartidoMundialEqualTo(true)
        .and()
        .fechaGreaterThan(ahora)
        .sortByFecha()
        .limit(limit)
        .findAll();
  }

  /// Retorna los partidos del Mundial ya finalizados.
  Future<List<PartidoLocalSchema>> findFinalizadosMundial({int limit = 64}) {
    return _isar.partidoLocalSchemas
        .filter()
        .esPartidoMundialEqualTo(true)
        .and()
        .estadoEqualTo(EstadoPartido.finalizado)
        .sortByFechaDesc()
        .limit(limit)
        .findAll();
  }

  /// Inserta o actualiza todos los partidos de la lista.
  ///
  /// Usa el índice único [externalId] con [replace: true] para UPSERT.
  Future<void> upsertAll(List<PartidoLocalSchema> partidos) async {
    await _isar.writeTxn(() async {
      await _isar.partidoLocalSchemas.putAll(partidos);
    });
  }

  /// Retorna el número total de partidos almacenados.
  Future<int> count() {
    return _isar.partidoLocalSchemas.count();
  }

  /// Retorna el número de partidos del Mundial almacenados.
  Future<int> countMundial() {
    return _isar.partidoLocalSchemas
        .filter()
        .esPartidoMundialEqualTo(true)
        .count();
  }
}
