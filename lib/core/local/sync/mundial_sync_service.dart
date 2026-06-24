/// Servicio de sincronización de datos Copa del Mundo 2026 con APIs externas.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-24
library;

import 'package:isar/isar.dart';

import '../../api/services/mundial_api_service.dart';
import '../repositories/partido_local_repository.dart';
import '../repositories/equipo_local_repository.dart';
import '../repositories/configuracion_local_repository.dart';
import '../schemas/partido_local_schema.dart';
import '../schemas/equipo_schema.dart';

/// Resultado de una operación de sincronización del Mundial.
class MundialSyncResult {
  const MundialSyncResult({
    required this.success,
    this.partidosActualizados = 0,
    this.equiposActualizados = 0,
    this.omitido = false,
    this.error,
  });

  final bool success;
  final int partidosActualizados;
  final int equiposActualizados;
  final bool omitido;
  final String? error;

  @override
  String toString() =>
      'MundialSyncResult(success: $success, omitido: $omitido, '
      'partidos: $partidosActualizados, equipos: $equiposActualizados)';
}

/// Orquesta la sincronización del Mundial 2026 entre APIs externas e Isar.
class MundialSyncService {
  const MundialSyncService({
    required this.isar,
    required this.apiService,
  });

  final Isar isar;
  final MundialApiService apiService;

  ConfiguracionLocalRepository get _configRepo =>
      ConfiguracionLocalRepository(isar);
  PartidoLocalRepository get _partidoRepo => PartidoLocalRepository(isar);
  EquipoLocalRepository get _equipoRepo => EquipoLocalRepository(isar);

  /// Ejecuta la sincronización si no se realizó en las últimas 6 horas.
  Future<MundialSyncResult> syncIfNeeded() async {
    try {
      final config = await _configRepo.getOrDefaults();
      final lastSync = config.lastSyncTimestamp;
      final now = DateTime.now();

      if (lastSync != null && now.difference(lastSync).inHours < 6) {
        return const MundialSyncResult(success: true, omitido: true);
      }

      return await _ejecutarSync();
    } catch (e) {
      return MundialSyncResult(
        success: false,
        error: 'Error inesperado: $e',
      );
    }
  }

  /// Fuerza la sincronización completa ignorando throttle.
  Future<MundialSyncResult> syncForced() => _ejecutarSync();

  Future<MundialSyncResult> _ejecutarSync() async {
    int equiposActualizados = 0;
    int partidosActualizados = 0;

    final equiposApi = await apiService.fetchEquiposMundial();
    if (equiposApi.isNotEmpty) {
      final equipos = equiposApi.map(_mapEquipoApiToSchema).toList();
      await _equipoRepo.upsertAll(equipos);
      equiposActualizados = equipos.length;
    }

    final partidosApi = await apiService.fetchPartidosMundial();
    if (partidosApi.isNotEmpty) {
      final partidos =
          partidosApi.map((p) => _mapPartidoApiToSchema(p, equiposApi)).toList();
      await _partidoRepo.upsertAll(partidos);
      partidosActualizados = partidos.length;
    }

    if (equiposActualizados > 0 || partidosActualizados > 0) {
      await _configRepo.updateLastSync(DateTime.now());
    }

    return MundialSyncResult(
      success: true,
      equiposActualizados: equiposActualizados,
      partidosActualizados: partidosActualizados,
    );
  }

  EquipoSchema _mapEquipoApiToSchema(EquipoApiModel api) {
    return EquipoSchema()
      ..externalId = api.externalId
      ..nombre = api.nombre
      ..pais = api.pais
      ..ligaId = 1
      ..escudoUrl = api.escudoUrl
      ..paisBanderaUrl = api.banderaUrl
      ..banderaUrl = api.banderaUrl
      ..esSeleccionMundial = true
      ..codigoPais = api.codigoPais
      ..grupoCopaMundo = api.grupo
      ..updatedAt = DateTime.now();
  }

  PartidoLocalSchema _mapPartidoApiToSchema(
    PartidoApiModel api,
    List<EquipoApiModel> equipos,
  ) {
    String? banderaLocal = api.banderaLocalUrl;
    String? banderaVisitante = api.banderaVisitanteUrl;

    if (banderaLocal == null) {
      final eq =
          equipos.where((e) => e.externalId == api.equipoLocalId).firstOrNull;
      banderaLocal = eq?.banderaUrl;
    }
    if (banderaVisitante == null) {
      final eq = equipos
          .where((e) => e.externalId == api.equipoVisitanteId)
          .firstOrNull;
      banderaVisitante = eq?.banderaUrl;
    }

    return PartidoLocalSchema()
      ..externalId = api.externalId
      ..ligaId = 1
      ..equipoLocalId = api.equipoLocalId
      ..equipoLocalNombre = api.equipoLocalNombre
      ..equipoLocalEscudoUrl = api.equipoLocalEscudoUrl
      ..banderaLocalUrl = banderaLocal
      ..equipoVisitanteId = api.equipoVisitanteId
      ..equipoVisitanteNombre = api.equipoVisitanteNombre
      ..equipoVisitanteEscudoUrl = api.equipoVisitanteEscudoUrl
      ..banderaVisitanteUrl = banderaVisitante
      ..fecha = api.fecha
      ..estado = _parseEstado(api.estado)
      ..golesLocal = api.golesLocal
      ..golesVisitante = api.golesVisitante
      ..grupo = api.grupo
      ..ronda = api.ronda
      ..jornada = api.jornada
      ..estadio = api.estadio
      ..ciudad = api.ciudad
      ..esPartidoMundial = true
      ..updatedAt = DateTime.now();
  }

  EstadoPartido _parseEstado(String valor) {
    switch (valor.toUpperCase()) {
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
