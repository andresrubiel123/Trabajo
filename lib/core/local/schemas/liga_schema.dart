/// Esquema Isar para ligas de fútbol.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
library;

import 'package:isar/isar.dart';

part 'liga_schema.g.dart';

/// Representa una liga de fútbol almacenada localmente en Isar.
///
/// Precargada desde [assets/data/ligas_seed.json] en el primer inicio
/// y actualizada incrementalmente desde el servidor.
@collection
class LigaSchema {
  LigaSchema();

  /// ID autoincrementado por Isar.
  Id isarId = Isar.autoIncrement;

  /// ID externo de la liga (del backend o TheSportsDB).
  @Index(unique: true, replace: true)
  late int externalId;

  /// Nombre de la liga (ej: "Premier League").
  late String nombre;

  /// URL del logo de la liga.
  String? logoUrl;

  /// País al que pertenece la liga.
  late String pais;

  /// URL de la bandera del país.
  String? banderaUrl;

  /// Temporada activa (ej: 2025).
  int? temporada;

  /// Fecha de última actualización para UPSERT incremental.
  late DateTime updatedAt;
}
