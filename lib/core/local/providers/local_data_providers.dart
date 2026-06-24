/// Providers de Riverpod para los repositorios locales de Isar.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
/// Actualizado: 2026-06-24 — Providers Copa del Mundo 2026.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../sync/sync_service.dart';
import '../sync/mundial_sync_service.dart';
import '../../api/api_client.dart';
import '../../api/services/mundial_api_service.dart';
import '../repositories/liga_local_repository.dart';
import '../repositories/equipo_local_repository.dart';
import '../repositories/partido_local_repository.dart';
import '../repositories/jugador_local_repository.dart';
import '../repositories/favorito_local_repository.dart';
import '../repositories/configuracion_local_repository.dart';
import '../repositories/prediccion_guardada_local_repository.dart';
import '../schemas/liga_schema.dart';
import '../schemas/equipo_schema.dart';
import '../schemas/partido_local_schema.dart';
import '../schemas/configuracion_schema.dart';
import 'isar_providers.dart';

// ── Repositorios ──────────────────────────────────────────────────────────────

/// Provider del repositorio de ligas.
final ligaLocalRepoProvider = Provider<LigaLocalRepository>((ref) {
  final isar = ref.watch(isarProvider);
  return LigaLocalRepository(isar);
});

/// Provider del repositorio de equipos.
final equipoLocalRepoProvider = Provider<EquipoLocalRepository>((ref) {
  final isar = ref.watch(isarProvider);
  return EquipoLocalRepository(isar);
});

/// Provider del repositorio de partidos recientes.
final partidoLocalRepoProvider = Provider<PartidoLocalRepository>((ref) {
  final isar = ref.watch(isarProvider);
  return PartidoLocalRepository(isar);
});

/// Provider del repositorio de jugadores.
final jugadorLocalRepoProvider = Provider<JugadorLocalRepository>((ref) {
  final isar = ref.watch(isarProvider);
  return JugadorLocalRepository(isar);
});

/// Provider del repositorio de favoritos.
final favoritoLocalRepoProvider = Provider<FavoritoLocalRepository>((ref) {
  final isar = ref.watch(isarProvider);
  return FavoritoLocalRepository(isar);
});

/// Provider del repositorio de configuración (singleton).
final configuracionLocalRepoProvider =
    Provider<ConfiguracionLocalRepository>((ref) {
  final isar = ref.watch(isarProvider);
  return ConfiguracionLocalRepository(isar);
});

/// Provider del repositorio de predicciones guardadas.
final prediccionGuardadaLocalRepoProvider =
    Provider<PrediccionGuardadaLocalRepository>((ref) {
  final isar = ref.watch(isarProvider);
  return PrediccionGuardadaLocalRepository(isar);
});

// ── Data Providers (FutureProvider para UI) ───────────────────────────────────

/// Ligas disponibles en la base local, listas para mostrar en UI.
final ligasLocalProvider = FutureProvider<List<LigaSchema>>((ref) {
  final repo = ref.watch(ligaLocalRepoProvider);
  return repo.findAll();
});

/// Equipos de una liga específica.
///
/// Uso:
/// ```dart
/// ref.watch(equiposPorLigaProvider(ligaId))
/// ```
final equiposPorLigaProvider =
    FutureProvider.family<List<EquipoSchema>, int>((ref, ligaId) {
  final repo = ref.watch(equipoLocalRepoProvider);
  return repo.findByLiga(ligaId);
});

/// Partidos recientes (últimos 50) para la pantalla principal.
final partidosRecientesProvider =
    FutureProvider<List<PartidoLocalSchema>>((ref) {
  final repo = ref.watch(partidoLocalRepoProvider);
  return repo.findRecientes(limit: 50);
});

/// Partidos de una liga específica.
final partidosPorLigaProvider =
    FutureProvider.family<List<PartidoLocalSchema>, int>((ref, ligaId) {
  final repo = ref.watch(partidoLocalRepoProvider);
  return repo.findByLiga(ligaId);
});

/// Configuración actual del usuario.
final configuracionProvider =
    FutureProvider<ConfiguracionSchema>((ref) {
  final repo = ref.watch(configuracionLocalRepoProvider);
  return repo.getOrDefaults();
});

// ── Copa del Mundo 2026 ────────────────────────────────────────────────────────

/// Todos los partidos de la Copa del Mundo 2026 (hasta 64).
final partidosMundialProvider =
    FutureProvider<List<PartidoLocalSchema>>((ref) {
  final repo = ref.watch(partidoLocalRepoProvider);
  return repo.findByMundial(limit: 64);
});

/// Partidos del Mundial por ronda/fase.
///
/// Uso:
/// ```dart
/// ref.watch(partidosMundialPorRondaProvider('Fase de Grupos'))
/// ```
final partidosMundialPorRondaProvider =
    FutureProvider.family<List<PartidoLocalSchema>, String>((ref, ronda) {
  final repo = ref.watch(partidoLocalRepoProvider);
  return repo.findByRonda(ronda);
});

/// Partidos del Mundial por grupo (solo fase de grupos).
///
/// Uso:
/// ```dart
/// ref.watch(partidosMundialPorGrupoProvider('A'))
/// ```
final partidosMundialPorGrupoProvider =
    FutureProvider.family<List<PartidoLocalSchema>, String>((ref, grupo) {
  final repo = ref.watch(partidoLocalRepoProvider);
  return repo.findByGrupo(grupo);
});

/// Próximos partidos del Mundial (máximo 5 para el widget del Dashboard).
final proximosPartidosMundialProvider =
    FutureProvider<List<PartidoLocalSchema>>((ref) {
  final repo = ref.watch(partidoLocalRepoProvider);
  return repo.findProximosMundial(limit: 5);
});

/// Selecciones participantes en el Mundial 2026 (32 equipos).
final equiposMundialProvider = FutureProvider<List<EquipoSchema>>((ref) {
  final repo = ref.watch(equipoLocalRepoProvider);
  return repo.findAll().then(
    (all) => all.where((e) => e.esSeleccionMundial == true).toList()
      ..sort((a, b) => a.nombre.compareTo(b.nombre)),
  );
});

/// Número total de partidos del Mundial en la BD local.
final countPartidosMundialProvider = FutureProvider<int>((ref) {
  final repo = ref.watch(partidoLocalRepoProvider);
  return repo.countMundial();
});

// ── Servicios de Sincronización ────────────────────────────────────────────────

/// Provider para el servicio de sincronización incremental con el backend propio.
final syncServiceProvider = Provider<SyncService>((ref) {
  final isar = ref.watch(isarProvider);
  final apiClient = ref.watch(apiClientProvider);
  return SyncService(isar: isar, dio: apiClient.dio);
});

/// Provider del servicio de API para Copa del Mundo.
final mundialApiServiceProvider = Provider<MundialApiService>((ref) {
  return MundialApiService();
});

/// Provider del servicio de sincronización de Copa del Mundo.
final mundialSyncServiceProvider = Provider<MundialSyncService>((ref) {
  final isar = ref.watch(isarProvider);
  final apiService = ref.watch(mundialApiServiceProvider);
  return MundialSyncService(isar: isar, apiService: apiService);
});
