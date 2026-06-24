import 'dart:typed_data';

/// Entidad de dominio que representa una combinación de resultados generada de forma optimizada.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-16
class CombinacionEntity {
  CombinacionEntity({
    required this.indice,
    required this.resultadosCodificados,
    required this.nombres,
  });

  /// Número de combinación (1-based).
  final int indice;

  /// Lista de resultados codificados en bytes para ahorrar memoria:
  /// 1 = Local, 0 = Empate, 2 = Visitante
  final Uint8List resultadosCodificados;

  /// Nombres de los partidos compartidos por todas las combinaciones en el mismo orden.
  final List<String> nombres;

  // ── Cache de campos para evitar asignación excesiva de memoria ───────────
  List<String>? _resultadosCache;
  String? _textoLineaCache;
  String? _resultadosCortosCache;
  String? _detallePartidosLineaCache;

  /// Getter computado para mantener compatibilidad total con el resto del código.
  List<String> get resultados {
    return _resultadosCache ??= resultadosCodificados.map((code) {
      if (code == 1) return 'Local';
      if (code == 0) return 'Empate';
      return 'Visitante';
    }).toList();
  }

  /// Formatea la combinación como línea de texto sin asignar memoria extra.
  /// Ej: "1. Real Madrid: Local | Bayern: Empate | PSG: Visitante"
  String toTextoLinea() {
    if (_textoLineaCache != null) return _textoLineaCache!;
    final partes = List.generate(
      resultadosCodificados.length,
      (i) {
        final code = resultadosCodificados[i];
        final res = code == 1 ? 'Local' : (code == 0 ? 'Empate' : 'Visitante');
        return '${nombres[i]}: $res';
      },
    );
    return _textoLineaCache = '$indice. ${partes.join(' | ')}';
  }

  /// Retorna la cadena de detalle formateada para el listado principal de partidos.
  String toDetallePartidosLinea() {
    if (_detallePartidosLineaCache != null) return _detallePartidosLineaCache!;
    final partes = List.generate(
      resultadosCodificados.length,
      (i) {
        final code = resultadosCodificados[i];
        final res = code == 1 ? 'Local' : (code == 0 ? 'Empate' : 'Visitante');
        return '${nombres[i]}: $res';
      },
    );
    return _detallePartidosLineaCache = partes.join(' │ ');
  }

  /// Formatea solo los resultados cortos: "L | E | V"
  String toResultadosCortos() {
    if (_resultadosCortosCache != null) return _resultadosCortosCache!;
    final partes = resultadosCodificados.map((code) {
      if (code == 1) return 'L';
      if (code == 0) return 'E';
      return 'V';
    });
    return _resultadosCortosCache = partes.join(' | ');
  }

  @override
  String toString() => toTextoLinea();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CombinacionEntity) return false;
    if (indice != other.indice) return false;
    if (resultadosCodificados.length != other.resultadosCodificados.length) return false;
    for (int i = 0; i < resultadosCodificados.length; i++) {
      if (resultadosCodificados[i] != other.resultadosCodificados[i]) return false;
    }
    return true;
  }

  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + indice;
    for (int i = 0; i < resultadosCodificados.length; i++) {
      result = 37 * result + resultadosCodificados[i];
    }
    return result;
  }
}
