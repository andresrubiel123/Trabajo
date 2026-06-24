/// Esquema Isar para las preferencias de configuración del usuario (singleton).
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
library;

import 'package:isar/isar.dart';

part 'configuracion_schema.g.dart';

/// Almacena la configuración del usuario como registro singleton en Isar.
///
/// Restricción: siempre un único registro con [isarId] == 1.
/// También almacena metadatos de sincronización (lastSyncTimestamp, seedVersion).
@collection
class ConfiguracionSchema {
  ConfiguracionSchema();

  /// ID fijo = 1 (patrón singleton en Isar).
  Id isarId = 1;

  late bool temaOscuro;
  late String idioma;
  late List<int> ligasFavoritasIds;
  late bool notificacionesActivas;

  /// Timestamp de la última sincronización exitosa. Null si nunca se sincronizó.
  DateTime? lastSyncTimestamp;

  /// Versión del seed aplicado.
  late int seedVersion;

  ConfiguracionSchema.defaults()
      : isarId = 1,
        temaOscuro = true,
        idioma = 'es',
        ligasFavoritasIds = [],
        notificacionesActivas = false,
        lastSyncTimestamp = null,
        seedVersion = 0;
}
