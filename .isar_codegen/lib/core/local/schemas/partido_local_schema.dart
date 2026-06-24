/// Esquema Isar para partidos de fútbol recientes.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
/// Actualizado: 2026-06-24 — Campos Copa del Mundo (bandera, grupo, ronda).
library;

import 'package:isar/isar.dart';

part 'partido_local_schema.g.dart';

/// Estado de un partido almacenado localmente.
enum EstadoPartido {
  programado,
  enJuego,
  finalizado,
  pospuesto,
  cancelado,
}

/// Representa un partido reciente sincronizado desde el servidor o APIs externas.
///
/// Campos de equipos denormalizados para evitar joins al renderizar listas.
/// Versión 2: agrega campos para Copa del Mundo (banderas, grupo, ronda).
@collection
class PartidoLocalSchema {
  PartidoLocalSchema();

  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late int externalId;

  late int equipoLocalId;
  late String equipoLocalNombre;
  String? equipoLocalEscudoUrl;

  /// URL de la bandera del país local (denormalizado para offline).
  String? banderaLocalUrl;

  late int equipoVisitanteId;
  late String equipoVisitanteNombre;
  String? equipoVisitanteEscudoUrl;

  /// URL de la bandera del país visitante (denormalizado para offline).
  String? banderaVisitanteUrl;

  @Index()
  late int ligaId;

  @Index()
  late DateTime fecha;

  @enumerated
  late EstadoPartido estado;

  int? golesLocal;
  int? golesVisitante;
  late DateTime updatedAt;

  /// Grupo de la fase de grupos (ej: "A", "B", ..., "H"). Null si no aplica.
  @Index()
  String? grupo;

  /// Fase del torneo (ej: "Fase de Grupos", "Octavos de Final", "Final").
  @Index()
  String? ronda;

  /// Indica si este partido pertenece a una Copa del Mundo.
  /// Permite filtros rápidos sin joins.
  @Index()
  late bool esPartidoMundial;

  /// Jornada o matchday dentro de la fase (ej: 1, 2, 3 en grupos).
  int? jornada;

  /// Sede/estadio del partido (cuando está disponible).
  String? estadio;

  /// Ciudad del partido.
  String? ciudad;
}
