/// Servicio de sincronización incremental entre el servidor y la base local Isar.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
library;

import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

import '../repositories/configuracion_local_repository.dart';
import '../repositories/liga_local_repository.dart';
import '../repositories/equipo_local_repository.dart';
import '../repositories/partido_local_repository.dart';
import '../schemas/liga_schema.dart';
import '../schemas/equipo_schema.dart';
import '../schemas/partido_local_schema.dart';

/// Resultado de una operación de sincronización.
class SyncResult {
  const SyncResult({
    required this.synced,
    this.ligasActualizadas = 0,
    this.equiposActualizados = 0,
    this.partidosActualizados = 0,
    this.error,
  });

  /// True si la sincronización completó sin errores críticos.
  final bool synced;
  final int ligasActualizadas;
  final int equiposActualizados;
  final int partidosActualizados;

  /// Mensaje de error si [synced] es false.
  final String? error;

  @override
  String toString() =>
      'SyncResult(synced: $synced, ligas: $ligasActualizadas, '
      'equipos: $equiposActualizados, partidos: $partidosActualizados)';
}

/// Sincroniza datos del servidor con la base local Isar de forma incremental.
///
/// Flujo:
/// 1. Lee [ConfiguracionSchema.lastSyncTimestamp].
/// 2. Consulta `GET /api/v1/sync/metadata?since={timestamp}`.
/// 3. Si `hasChanges: false` → retorna sin tocar la red.
/// 4. Si `hasChanges: true` → descarga y hace UPSERT por colección.
/// 5. Actualiza [ConfiguracionSchema.lastSyncTimestamp].
///
/// IMPORTANTE: El endpoint `/api/v1/sync/metadata` debe implementarse
/// en el backend Spring Boot. Debe retornar:
/// ```json
/// {
///   "hasChanges": true,
///   "ligas": [...],
///   "equipos": [...],
///   "partidos": [...]
/// }
/// ```
class SyncService {
  /// Constructor del servicio.
  ///
  /// Parámetros:
  /// - [isar]: instancia de Isar.
  /// - [dio]: cliente HTTP ya configurado.
  const SyncService({
    required this.isar,
    required this.dio,
  });

  final Isar isar;
  final Dio dio;

  // ── Repositories (internos, no inyectados por simplicidad) ───────────────
  ConfiguracionLocalRepository get _configRepo => ConfiguracionLocalRepository(isar);
  LigaLocalRepository get _ligaRepo => LigaLocalRepository(isar);
  EquipoLocalRepository get _equipoRepo => EquipoLocalRepository(isar);
  PartidoLocalRepository get _partidoRepo => PartidoLocalRepository(isar);

  /// Ejecuta la sincronización incremental.
  ///
  /// Es seguro llamar en cada inicio de app — si no hay cambios, retorna inmediatamente.
  Future<SyncResult> sync() async {
    try {
      final config = await _configRepo.getOrDefaults();
      final since = config.lastSyncTimestamp;

      // Preguntar al servidor si hay cambios
      final queryParams = since != null
          ? {'since': since.toIso8601String()}
          : <String, dynamic>{};

      final response = await dio.get(
        '/sync/metadata',
        queryParameters: queryParams,
      );

      final data = response.data as Map<String, dynamic>?;
      if (data == null) {
        return const SyncResult(synced: false, error: 'Respuesta vacía del servidor');
      }

      final hasChanges = data['hasChanges'] as bool? ?? false;
      if (!hasChanges) {
        return const SyncResult(synced: true);
      }

      // Sincronizar cada colección de forma independiente
      int ligasCount = 0;
      int equiposCount = 0;
      int partidosCount = 0;

      if (data['ligas'] != null) {
        final ligas = _parseLigas(data['ligas'] as List<dynamic>);
        await _ligaRepo.upsertAll(ligas);
        ligasCount = ligas.length;
      }

      if (data['equipos'] != null) {
        final equipos = _parseEquipos(data['equipos'] as List<dynamic>);
        await _equipoRepo.upsertAll(equipos);
        equiposCount = equipos.length;
      }

      if (data['partidos'] != null) {
        final partidos = _parsePartidos(data['partidos'] as List<dynamic>);
        await _partidoRepo.upsertAll(partidos);
        partidosCount = partidos.length;
      }

      // Actualizar timestamp de la última sincronización exitosa
      await _configRepo.updateLastSync(DateTime.now());

      return SyncResult(
        synced: true,
        ligasActualizadas: ligasCount,
        equiposActualizados: equiposCount,
        partidosActualizados: partidosCount,
      );
    } on DioException catch (e) {
      // Error de red — no es crítico, la app funciona con datos locales
      return SyncResult(
        synced: false,
        error: 'Error de red: ${e.message}',
      );
    } catch (e) {
      return SyncResult(
        synced: false,
        error: 'Error inesperado: $e',
      );
    }
  }

  // ── Parsers privados ─────────────────────────────────────────────────────

  List<LigaSchema> _parseLigas(List<dynamic> lista) {
    return lista.map((item) {
      final liga = LigaSchema()
        ..externalId = item['id'] as int
        ..nombre = item['nombre'] as String? ?? ''
        ..pais = item['pais'] as String? ?? ''
        ..logoUrl = item['logoUrl'] as String?
        ..banderaUrl = item['banderaUrl'] as String?
        ..temporada = item['temporada'] as int?
        ..updatedAt = DateTime.tryParse(item['updatedAt'] as String? ?? '') ?? DateTime.now();
      return liga;
    }).toList();
  }

  List<EquipoSchema> _parseEquipos(List<dynamic> lista) {
    return lista.map((item) {
      final equipo = EquipoSchema()
        ..externalId = item['id'] as int
        ..nombre = item['nombre'] as String? ?? ''
        ..ligaId = item['ligaId'] as int? ?? 0
        ..pais = item['pais'] as String? ?? ''
        ..escudoUrl = item['escudoUrl'] as String?
        ..paisBanderaUrl = item['banderaUrl'] as String?
        ..updatedAt = DateTime.tryParse(item['updatedAt'] as String? ?? '') ?? DateTime.now();
      return equipo;
    }).toList();
  }

  List<PartidoLocalSchema> _parsePartidos(List<dynamic> lista) {
    return lista.map((item) {
      final local = item['equipoLocal'] as Map<String, dynamic>? ?? {};
      final visitante = item['equipoVisitante'] as Map<String, dynamic>? ?? {};

      final partido = PartidoLocalSchema()
        ..externalId = item['id'] as int
        ..equipoLocalId = local['id'] as int? ?? 0
        ..equipoLocalNombre = local['nombre'] as String? ?? 'Local'
        ..equipoLocalEscudoUrl = local['escudoUrl'] as String?
        ..equipoVisitanteId = visitante['id'] as int? ?? 0
        ..equipoVisitanteNombre = visitante['nombre'] as String? ?? 'Visitante'
        ..equipoVisitanteEscudoUrl = visitante['escudoUrl'] as String?
        ..ligaId = item['ligaId'] as int? ?? 0
        ..fecha = DateTime.tryParse(item['fecha'] as String? ?? '') ?? DateTime.now()
        ..estado = _parseEstado(item['estado'] as String?)
        ..golesLocal = item['golesLocal'] as int?
        ..golesVisitante = item['golesVisitante'] as int?
        ..updatedAt = DateTime.tryParse(item['updatedAt'] as String? ?? '') ?? DateTime.now();
      return partido;
    }).toList();
  }

  EstadoPartido _parseEstado(String? valor) {
    switch (valor?.toUpperCase()) {
      case 'FINISHED':
      case 'FT':
        return EstadoPartido.finalizado;
      case 'IN_PLAY':
      case 'LIVE':
        return EstadoPartido.enJuego;
      case 'POSTPONED':
        return EstadoPartido.pospuesto;
      case 'CANCELLED':
        return EstadoPartido.cancelado;
      default:
        return EstadoPartido.programado;
    }
  }
}
