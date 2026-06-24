/// Entidad de dominio que representa un partido deportivo en el módulo de combinaciones.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

/// Constantes de resultados disponibles para un partido.
class ResultadoPartido {
  static const String local = '1';
  static const String empate = 'X';
  static const String visitante = '2';

  static const List<String> todos = [local, empate, visitante];
}

/// Representa un partido configurado para el cálculo de combinaciones.
///
/// Puede crearse desde la pantalla de Predicciones (con datos reales
/// de equipos y escudos) o manualmente (con nombre libre).
class PartidoEntity {
  const PartidoEntity({
    required this.id,
    required this.nombre,
    this.resultadoFijo,
    this.escudoLocalUrl,
    this.escudoVisitanteUrl,
    this.equipoLocal,
    this.equipoVisitante,
    this.resultadosSeleccionados = const [],
    this.fixtureId,
  });

  /// ID único del partido en la app (UUID local).
  final String id;

  /// Nombre de visualización del partido.
  /// Ej: "Real Madrid vs Barcelona"
  final String nombre;

  /// Si no es null, este partido tiene resultado fijo (1/X/2).
  final String? resultadoFijo;

  // ── Datos visuales (escudos reales desde la base local) ─────────────────
  /// URL del escudo del equipo local. Null en modo manual.
  final String? escudoLocalUrl;

  /// URL del escudo del equipo visitante. Null en modo manual.
  final String? escudoVisitanteUrl;

  /// Nombre del equipo local (para mostrar separado del [nombre] completo).
  final String? equipoLocal;

  /// Nombre del equipo visitante.
  final String? equipoVisitante;

  /// Resultados seleccionados por el usuario en el módulo de predicciones.
  /// Puede contener "1", "X" y/o "2" en cualquier combinación.
  /// Lista vacía = todos los resultados posibles.
  final List<String> resultadosSeleccionados;

  /// ID externo del fixture (del backend). Null en modo manual.
  final int? fixtureId;

  // ── Computed ──────────────────────────────────────────────────────────────

  /// True si este partido tiene un resultado fijo asignado.
  bool get tieneFijo => resultadoFijo != null && resultadoFijo!.isNotEmpty;

  /// True si el partido tiene al menos un resultado seleccionado.
  bool get tieneSeleccion => resultadosSeleccionados.isNotEmpty;

  /// True si el partido fue creado desde la pantalla de Predicciones (datos reales).
  bool get esDesdePredicciones => fixtureId != null;

  // ── CopyWith ─────────────────────────────────────────────────────────────

  PartidoEntity copyWith({
    String? id,
    String? nombre,
    String? resultadoFijo,
    bool clearFijo = false,
    String? escudoLocalUrl,
    String? escudoVisitanteUrl,
    String? equipoLocal,
    String? equipoVisitante,
    List<String>? resultadosSeleccionados,
    int? fixtureId,
  }) {
    return PartidoEntity(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      resultadoFijo: clearFijo ? null : resultadoFijo ?? this.resultadoFijo,
      escudoLocalUrl: escudoLocalUrl ?? this.escudoLocalUrl,
      escudoVisitanteUrl: escudoVisitanteUrl ?? this.escudoVisitanteUrl,
      equipoLocal: equipoLocal ?? this.equipoLocal,
      equipoVisitante: equipoVisitante ?? this.equipoVisitante,
      resultadosSeleccionados: resultadosSeleccionados ?? this.resultadosSeleccionados,
      fixtureId: fixtureId ?? this.fixtureId,
    );
  }

  @override
  String toString() => 'PartidoEntity(id: $id, nombre: $nombre, '
      'fijo: $resultadoFijo, seleccion: $resultadosSeleccionados)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartidoEntity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
