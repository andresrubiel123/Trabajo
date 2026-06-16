/// Entidad de dominio que representa un partido deportivo.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

class PartidoEntity {
  const PartidoEntity({
    required this.id,
    required this.nombre,
    this.resultadoFijo,
  });

  final String id;
  final String nombre;

  /// Si no es null, este partido tiene resultado fijo (Local/Empate/Visitante).
  final String? resultadoFijo;

  PartidoEntity copyWith({
    String? id,
    String? nombre,
    String? resultadoFijo,
    bool clearFijo = false,
  }) {
    return PartidoEntity(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      resultadoFijo: clearFijo ? null : resultadoFijo ?? this.resultadoFijo,
    );
  }

  bool get tieneFijo => resultadoFijo != null && resultadoFijo!.isNotEmpty;

  @override
  String toString() => 'PartidoEntity(id: $id, nombre: $nombre, fijo: $resultadoFijo)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartidoEntity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
