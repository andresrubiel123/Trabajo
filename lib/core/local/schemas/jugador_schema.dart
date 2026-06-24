/// Esquema Isar para jugadores de fútbol.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
library;

import 'package:isar/isar.dart';

part 'jugador_schema.g.dart';

/// Representa un jugador sincronizado desde el servidor.
@collection
class JugadorSchema {
  JugadorSchema();

  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late int externalId;

  late String nombre;
  late String apellido;

  @Index()
  late int equipoId;

  late String posicion;
  String? fotoUrl;
  late String nacionalidad;
  String? banderaNacionalidadUrl;
  late DateTime updatedAt;
}
