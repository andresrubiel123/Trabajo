/// Entidad de dominio que representa una combinación de resultados generada.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

class CombinacionEntity {
  const CombinacionEntity({
    required this.indice,
    required this.resultados,
    required this.nombres,
  });

  /// Número de combinación (1-based).
  final int indice;

  /// Lista de resultados: ej. ['Local', 'Empate', 'Visitante']
  final List<String> resultados;

  /// Nombres de los partidos en el mismo orden que resultados.
  final List<String> nombres;

  /// Formatea la combinación como línea de texto.
  /// Ej: "1. Real Madrid: Local | Bayern: Empate | PSG: Visitante"
  String toTextoLinea() {
    final partes = List.generate(
      resultados.length,
      (i) => '${nombres[i]}: ${resultados[i]}',
    );
    return '$indice. ${partes.join(' | ')}';
  }

  /// Formatea solo los resultados cortos: "L | E | V"
  String toResultadosCortos() {
    return resultados.map((r) => r[0]).join(' | ');
  }

  @override
  String toString() => toTextoLinea();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CombinacionEntity &&
          runtimeType == other.runtimeType &&
          indice == other.indice &&
          resultados.toString() == other.resultados.toString();

  @override
  int get hashCode => Object.hash(indice, resultados.toString());
}
