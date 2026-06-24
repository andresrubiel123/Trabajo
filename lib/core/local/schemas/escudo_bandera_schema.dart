/// Esquema Isar para referencias de escudos y banderas de equipos y países.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
library;

import 'package:isar/isar.dart';

part 'escudo_bandera_schema.g.dart';

/// Tipo de imagen almacenada.
enum TipoImagen {
  escudo,
  bandera,
}

/// Almacena la referencia (URL) de escudos y banderas.
///
/// [cached_network_image] gestiona el archivo físico en caché de disco;
/// esta colección guarda la URL y metadatos para queries locales.
@collection
class EscudoBanderaSchema {
  EscudoBanderaSchema();

  /// ID autoincrementado por Isar.
  Id isarId = Isar.autoIncrement;

  /// ID externo del equipo o país al que pertenece la imagen.
  @Index(unique: true, replace: true)
  late String externalId;

  /// Tipo de imagen: escudo o bandera.
  @enumerated
  late TipoImagen tipo;

  /// URL pública de la imagen.
  late String url;

  /// Fecha de última actualización (para UPSERT incremental).
  late DateTime updatedAt;
}
