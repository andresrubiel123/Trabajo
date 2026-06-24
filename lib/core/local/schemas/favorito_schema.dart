/// Esquema Isar para favoritos del usuario.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
library;

import 'package:isar/isar.dart';

part 'favorito_schema.g.dart';

/// Tipo de entidad marcada como favorita.
enum TipoFavorito {
  liga,
  equipo,
  partido,
}

/// Almacena los favoritos del usuario de forma 100% local.
///
/// Esta colección NUNCA se sincroniza con el servidor.
@collection
class FavoritoSchema {
  FavoritoSchema();

  Id isarId = Isar.autoIncrement;

  @enumerated
  late TipoFavorito tipo;

  @Index()
  late String referenciaId;

  late String nombre;
  String? logoUrl;
  late DateTime creadoEn;
}
