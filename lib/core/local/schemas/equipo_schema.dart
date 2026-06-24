/// Esquema Isar para equipos de fútbol.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
/// Actualizado: 2026-06-24 — Campos para selecciones del Mundial.
library;

import 'package:isar/isar.dart';

part 'equipo_schema.g.dart';

/// Representa un equipo de fútbol almacenado localmente en Isar.
///
/// Precargado desde [assets/data/equipos_seed.json] y actualizado
/// incrementalmente desde el servidor o APIs externas mediante UPSERT.
/// Versión 2: agrega [banderaUrl] y [esSeleccionMundial].
@collection
class EquipoSchema {
  EquipoSchema();

  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late int externalId;

  @Index()
  late String nombre;

  /// URL del escudo del equipo.
  String? escudoUrl;

  /// URL de la bandera del país (denormalizado para offline sin joins).
  String? paisBanderaUrl;

  /// Alias alternativo para la bandera (para retrocompatibilidad).
  String? banderaUrl;

  @Index()
  late int ligaId;

  late String pais;
  late DateTime updatedAt;

  /// Indica si este equipo es una selección participante en Copa del Mundo.
  @Index()
  late bool esSeleccionMundial;

  /// Código ISO-2 del país (ej: "AR", "BR", "DE"). Útil para banderas.
  String? codigoPais;

  /// Grupo asignado en la fase de grupos (ej: "A", "B"). Null si no aplica.
  String? grupoCopaMundo;
}
