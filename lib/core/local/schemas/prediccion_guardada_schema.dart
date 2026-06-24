/// Esquema Isar para predicciones guardadas temporalmente por el usuario.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
library;

import 'package:isar/isar.dart';

part 'prediccion_guardada_schema.g.dart';

/// Almacena las predicciones temporales con TTL de 24 horas.
///
/// Son auto-purgadas al llamar [purgarExpiradas()] en el repositorio.
/// Esta colección es 100% local y nunca se sincroniza con el servidor.
@collection
class PrediccionGuardadaSchema {
  PrediccionGuardadaSchema();

  Id isarId = Isar.autoIncrement;

  @Index()
  late int fixtureId;

  late String equipoLocalNombre;
  late String equipoVisitanteNombre;
  String? escudoLocalUrl;
  String? escudoVisitanteUrl;
  String? ligaNombre;

  /// Pick del usuario: "1" (Local), "X" (Empate), "2" (Visitante).
  late String pick;

  /// Porcentaje de confianza del modelo IA (0-100).
  late int confianza;

  String? notas;
  late DateTime guardadaEn;

  /// Fecha de expiración — 24h después de [guardadaEn].
  @Index()
  late DateTime expiraEn;
}
