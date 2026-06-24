/// Servicio de precarga inicial de datos desde los assets de la APK a Isar.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
/// Actualizado: 2026-06-24 v2 — Seed de partidos Copa del Mundo 2026.
library;

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';

import '../schemas/liga_schema.dart';
import '../schemas/equipo_schema.dart';
import '../schemas/partido_local_schema.dart';
import '../schemas/configuracion_schema.dart';
import '../schemas/escudo_bandera_schema.dart';

/// Versión actual del seed incluido en la APK.
///
/// Incrementar este valor cuando se actualicen los archivos JSON seed
/// para forzar la re-aplicación del seed con UPSERT en dispositivos existentes.
/// v2: agrega partidos Copa del Mundo 2026 y campos de banderas en equipos.
const int _kSeedVersion = 2;

/// Aplica los datos estáticos precargados en los assets de la APK a Isar.
///
/// Solo se ejecuta en el primer inicio o cuando [_kSeedVersion] es mayor
/// que la versión de seed registrada en [ConfiguracionSchema].
///
/// Colecciones afectadas:
/// - [LigaSchema] ← assets/data/ligas_seed.json
/// - [EquipoSchema] ← assets/data/equipos_seed.json (v2: 32 selecciones mundialistas)
/// - [PartidoLocalSchema] ← assets/data/partidos_mundial_seed.json (v2: 64 partidos)
/// - [EscudoBanderaSchema] ← URLs extraídas de ligas, equipos y banderas
/// - [ConfiguracionSchema] ← assets/data/config_default.json (solo primer inicio)
class SeedService {
  /// Constructor del servicio.
  ///
  /// Parámetros:
  /// - [isar]: instancia de Isar ya inicializada por [IsarService].
  const SeedService(this._isar);

  final Isar _isar;

  /// Aplica el seed si es necesario.
  ///
  /// Verifica [_kSeedVersion] contra [ConfiguracionSchema.seedVersion]:
  /// - Si el seed ya está en la versión actual → no hace nada.
  /// - Si es la primera vez → aplica todo y crea la configuración por defecto.
  /// - Si hay versión nueva → hace UPSERT solo con los datos del nuevo seed.
  Future<void> apply() async {
    final config = await _isar.configuracionSchemas.get(1);
    final currentSeedVersion = config?.seedVersion ?? 0;

    if (currentSeedVersion >= _kSeedVersion) return;

    await Future.wait([
      _seedLigas(),
      _seedEquipos(),
      _seedPartidosMundial(),
    ]);

    if (config == null) {
      await _seedConfiguracion();
    } else {
      // Solo actualizar seedVersion, no pisar las preferencias del usuario
      await _isar.writeTxn(() async {
        config.seedVersion = _kSeedVersion;
        await _isar.configuracionSchemas.put(config);
      });
    }
  }

  // ── Privados ─────────────────────────────────────────────────────────────

  /// Carga ligas desde el JSON seed y hace UPSERT en Isar.
  Future<void> _seedLigas() async {
    final raw = await rootBundle.loadString('assets/data/ligas_seed.json');
    final data = jsonDecode(raw) as Map<String, dynamic>;
    final listaJson = data['ligas'] as List<dynamic>;

    final ligas = listaJson.map((item) {
      final liga = LigaSchema()
        ..externalId = item['externalId'] as int
        ..nombre = item['nombre'] as String
        ..pais = item['pais'] as String
        ..logoUrl = item['logoUrl'] as String?
        ..banderaUrl = item['banderaUrl'] as String?
        ..temporada = item['temporada'] as int?
        ..updatedAt = DateTime.now();
      return liga;
    }).toList();

    final escudos = listaJson
        .where((item) => item['logoUrl'] != null)
        .map((item) {
          final escudo = EscudoBanderaSchema()
            ..externalId = 'liga_${item['externalId']}'
            ..tipo = TipoImagen.escudo
            ..url = item['logoUrl'] as String
            ..updatedAt = DateTime.now();
          return escudo;
        })
        .toList();

    await _isar.writeTxn(() async {
      await _isar.ligaSchemas.putAll(ligas);
      await _isar.escudoBanderaSchemas.putAll(escudos);
    });
  }

  /// Carga equipos desde el JSON seed y hace UPSERT en Isar.
  ///
  /// v2: Incluye las 32 selecciones del Mundial 2026 con banderas y grupos.
  Future<void> _seedEquipos() async {
    final raw = await rootBundle.loadString('assets/data/equipos_seed.json');
    final data = jsonDecode(raw) as Map<String, dynamic>;
    final listaJson = data['equipos'] as List<dynamic>;

    final equipos = listaJson.map((item) {
      final equipo = EquipoSchema()
        ..externalId = item['externalId'] as int
        ..nombre = item['nombre'] as String
        ..ligaId = item['ligaId'] as int
        ..pais = item['pais'] as String
        ..escudoUrl = item['escudoUrl'] as String?
        ..paisBanderaUrl = item['paisBanderaUrl'] as String?
        ..banderaUrl = item['paisBanderaUrl'] as String?
        ..esSeleccionMundial = (item['esSeleccionMundial'] as bool?) ?? false
        ..codigoPais = item['codigoPais'] as String?
        ..grupoCopaMundo = item['grupoCopaMundo'] as String?
        ..updatedAt = DateTime.now();
      return equipo;
    }).toList();

    final escudos = <EscudoBanderaSchema>[];
    for (final item in listaJson) {
      if (item['escudoUrl'] != null) {
        escudos.add(EscudoBanderaSchema()
          ..externalId = 'equipo_${item['externalId']}'
          ..tipo = TipoImagen.escudo
          ..url = item['escudoUrl'] as String
          ..updatedAt = DateTime.now());
      }
      if (item['paisBanderaUrl'] != null) {
        escudos.add(EscudoBanderaSchema()
          ..externalId = 'bandera_${item['codigoPais'] ?? item['externalId']}'
          ..tipo = TipoImagen.bandera
          ..url = item['paisBanderaUrl'] as String
          ..updatedAt = DateTime.now());
      }
    }

    await _isar.writeTxn(() async {
      await _isar.equipoSchemas.putAll(equipos);
      await _isar.escudoBanderaSchemas.putAll(escudos);
    });
  }

  /// Carga los 64 partidos del Mundial 2026 desde el JSON seed.
  ///
  /// Solo hace UPSERT si no existen ya (idempotente por [externalId]).
  /// Esto garantiza disponibilidad offline sin depender del backend.
  Future<void> _seedPartidosMundial() async {
    final raw =
        await rootBundle.loadString('assets/data/partidos_mundial_seed.json');
    final data = jsonDecode(raw) as Map<String, dynamic>;
    final listaJson = data['partidos'] as List<dynamic>;

    final partidos = listaJson.map((item) {
      final partido = PartidoLocalSchema()
        ..externalId = item['externalId'] as int
        ..ligaId = item['ligaId'] as int
        ..equipoLocalId = item['equipoLocalId'] as int
        ..equipoLocalNombre = item['equipoLocalNombre'] as String
        ..equipoLocalEscudoUrl = item['equipoLocalEscudoUrl'] as String?
        ..banderaLocalUrl = item['banderaLocalUrl'] as String?
        ..equipoVisitanteId = item['equipoVisitanteId'] as int
        ..equipoVisitanteNombre = item['equipoVisitanteNombre'] as String
        ..equipoVisitanteEscudoUrl = item['equipoVisitanteEscudoUrl'] as String?
        ..banderaVisitanteUrl = item['banderaVisitanteUrl'] as String?
        ..fecha =
            DateTime.tryParse(item['fecha'] as String? ?? '') ?? DateTime.now()
        ..estado = _parseEstado(item['estado'] as String?)
        ..golesLocal = item['golesLocal'] as int?
        ..golesVisitante = item['golesVisitante'] as int?
        ..grupo = item['grupo'] as String?
        ..ronda = item['ronda'] as String?
        ..jornada = item['jornada'] as int?
        ..estadio = item['estadio'] as String?
        ..ciudad = item['ciudad'] as String?
        ..esPartidoMundial = true
        ..updatedAt = DateTime.now();
      return partido;
    }).toList();

    await _isar.writeTxn(() async {
      await _isar.partidoLocalSchemas.putAll(partidos);
    });
  }

  /// Crea la configuración inicial desde el JSON por defecto.
  ///
  /// Solo se llama en el primer inicio (cuando no existe ningún registro en
  /// [ConfiguracionSchema]).
  Future<void> _seedConfiguracion() async {
    final raw = await rootBundle.loadString('assets/data/config_default.json');
    final data = jsonDecode(raw) as Map<String, dynamic>;

    final config = ConfiguracionSchema.defaults()
      ..temaOscuro = data['temaOscuro'] as bool? ?? true
      ..idioma = data['idioma'] as String? ?? 'es'
      ..ligasFavoritasIds =
          List<int>.from(data['ligasFavoritasIds'] as List? ?? [])
      ..notificacionesActivas =
          data['notificacionesActivas'] as bool? ?? false
      ..seedVersion = _kSeedVersion;

    await _isar.writeTxn(() async {
      await _isar.configuracionSchemas.put(config);
    });
  }

  /// Convierte el string de estado de un partido al enum [EstadoPartido].
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
