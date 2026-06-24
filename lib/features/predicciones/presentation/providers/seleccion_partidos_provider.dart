/// Provider de estado para la selección de partidos con signos 1/X/2.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../combinaciones/domain/entities/partido_entity.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/api/models/fixture_model.dart';
import '../../../../core/api/providers/football_providers.dart';

/// Estado de la selección de partidos para el módulo de combinaciones.
class SeleccionPartidosState {
  const SeleccionPartidosState({
    this.selecciones = const {},
  });

  /// Mapa de {fixtureId → PartidoEntity con resultadosSeleccionados}.
  ///
  /// Un partido aparece aquí cuando el usuario marca al menos un signo (1/X/2).
  final Map<int, PartidoEntity> selecciones;

  /// Número de partidos con al menos un signo seleccionado.
  int get totalPartidos => selecciones.length;

  /// True si ya se alcanzaron los 15 partidos máximos.
  bool get estaLleno => totalPartidos >= AppConstants.maxPartidos;

  /// True si hay al menos un partido seleccionado.
  bool get tieneSeleccion => selecciones.isNotEmpty;

  /// Lista de partidos en formato [PartidoEntity] lista para el motor de combinaciones.
  List<PartidoEntity> get comoListaPartidos => selecciones.values.toList();

  /// Calcula el total teórico de combinaciones con las selecciones actuales.
  int get totalCombinaciones {
    if (selecciones.isEmpty) return 0;
    return selecciones.values.fold<int>(1, (acc, p) {
      final signos = p.resultadosSeleccionados.isEmpty
          ? 3
          : p.resultadosSeleccionados.length;
      return acc * signos;
    });
  }

  SeleccionPartidosState copyWith({Map<int, PartidoEntity>? selecciones}) {
    return SeleccionPartidosState(
      selecciones: selecciones ?? this.selecciones,
    );
  }
}

/// Gestiona la selección de partidos y sus signos (1/X/2) desde la pantalla de Predicciones.
///
/// Restricciones:
/// - Máximo [AppConstants.maxPartidos] (15) partidos.
/// - Cada partido puede tener 1, 2 o 3 signos seleccionados.
/// - Quitar todos los signos de un partido lo elimina de la selección.
class SeleccionPartidosNotifier extends Notifier<SeleccionPartidosState> {
  @override
  SeleccionPartidosState build() => const SeleccionPartidosState();

  /// Activa o desactiva un signo (1/X/2) para un partido dado.
  ///
  /// Parámetros:
  /// - [fixture]: partido del que proviene la selección.
  /// - [signo]: "1" (local), "X" (empate) o "2" (visitante).
  void toggleSigno(FixtureModel fixture, String signo) {
    final fixtureId = fixture.fixture.id;
    final selecciones = Map<int, PartidoEntity>.from(state.selecciones);
    final actual = selecciones[fixtureId];

    if (actual == null) {
      // Partido no estaba seleccionado → agregar si hay espacio
      if (state.estaLleno) return;

      final homeAbbr = fixture.teams.home.code?.isNotEmpty == true 
          ? fixture.teams.home.code! 
          : (fixture.teams.home.name.length >= 3 
              ? fixture.teams.home.name.substring(0, 3).toUpperCase() 
              : fixture.teams.home.name.toUpperCase());

      final awayAbbr = fixture.teams.away.code?.isNotEmpty == true 
          ? fixture.teams.away.code! 
          : (fixture.teams.away.name.length >= 3 
              ? fixture.teams.away.name.substring(0, 3).toUpperCase() 
              : fixture.teams.away.name.toUpperCase());

      selecciones[fixtureId] = PartidoEntity(
        id: fixtureId.toString(),
        nombre: '$homeAbbr vs $awayAbbr',
        equipoLocal: fixture.teams.home.name,
        equipoVisitante: fixture.teams.away.name,
        escudoLocalUrl: fixture.teams.home.logo,
        escudoVisitanteUrl: fixture.teams.away.logo,
        resultadosSeleccionados: [signo],
        fixtureId: fixtureId,
      );
    } else {
      // Partido ya existe → toggle del signo
      final actuales = List<String>.from(actual.resultadosSeleccionados);
      if (actuales.contains(signo)) {
        actuales.remove(signo);
      } else {
        actuales.add(signo);
      }

      if (actuales.isEmpty) {
        // Sin signos → eliminar partido de la selección
        selecciones.remove(fixtureId);
      } else {
        selecciones[fixtureId] = actual.copyWith(
          resultadosSeleccionados: actuales,
        );
      }
    }

    state = state.copyWith(selecciones: selecciones);
  }

  /// Verifica si un signo específico está activo para un partido.
  ///
  /// Parámetros:
  /// - [fixtureId]: ID del partido.
  /// - [signo]: "1", "X" o "2".
  bool tieneSigno(int fixtureId, String signo) {
    return state.selecciones[fixtureId]?.resultadosSeleccionados.contains(signo) ?? false;
  }

  /// Verifica si un partido tiene al menos un signo seleccionado.
  bool estaSeleccionado(int fixtureId) {
    return state.selecciones.containsKey(fixtureId);
  }

  /// Elimina un partido completo de la selección.
  void quitarPartido(int fixtureId) {
    final selecciones = Map<int, PartidoEntity>.from(state.selecciones);
    selecciones.remove(fixtureId);
    state = state.copyWith(selecciones: selecciones);
  }

  /// Limpia toda la selección.
  void limpiar() => state = const SeleccionPartidosState();
}

/// Provider global de la selección de partidos para combinaciones.
final seleccionPartidosProvider =
    NotifierProvider<SeleccionPartidosNotifier, SeleccionPartidosState>(
  () => SeleccionPartidosNotifier(),
);

/// Provider que filtra y retorna los partidos de la Copa Mundial/Mundial.
final copaMundialFixturesProvider = FutureProvider<List<FixtureModel>>((ref) async {
  final competitions = await ref.watch(competitionsProvider.future);
  if (competitions.isEmpty) return [];

  final copaMundial = competitions.firstWhere(
    (c) => c.name.toLowerCase().contains('copa mundial') ||
           c.name.toLowerCase().contains('world cup') ||
           c.name.toLowerCase().contains('mundial'),
    orElse: () => competitions.first,
  );

  final fixtures = await ref.watch(fixturesProvider(FixtureParams(
    leagueId: copaMundial.id,
    season: 2025,
  )).future);

  // Filtrar solo los partidos que no han terminado (que faltan por jugar)
  return fixtures.where((f) => f.fixture.status.short != 'FT').toList();
});
