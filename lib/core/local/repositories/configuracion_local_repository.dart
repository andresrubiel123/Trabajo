/// Repositorio local para configuración del usuario (singleton Isar).
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
library;

import 'package:isar/isar.dart';
import '../schemas/configuracion_schema.dart';

/// Proporciona acceso de lectura/escritura al registro singleton de [ConfiguracionSchema].
///
/// El patrón singleton se logra fijando [isarId] = 1 en el schema.
class ConfiguracionLocalRepository {
  /// Constructor del repositorio.
  ///
  /// Parámetros:
  /// - [isar]: instancia de Isar inyectada desde [IsarService].
  const ConfiguracionLocalRepository(this._isar);

  final Isar _isar;

  /// Retorna la configuración actual del usuario.
  ///
  /// Retorna null si aún no existe el registro (antes de aplicar el seed).
  Future<ConfiguracionSchema?> get() {
    return _isar.configuracionSchemas.get(1);
  }

  /// Retorna la configuración o los valores por defecto si no existe.
  Future<ConfiguracionSchema> getOrDefaults() async {
    return await _isar.configuracionSchemas.get(1) ??
        ConfiguracionSchema.defaults();
  }

  /// Persiste la configuración completa.
  ///
  /// Parámetros:
  /// - [config]: objeto de configuración con todos los campos actualizados.
  Future<void> save(ConfiguracionSchema config) async {
    await _isar.writeTxn(() async {
      await _isar.configuracionSchemas.put(config);
    });
  }

  /// Actualiza únicamente el timestamp de la última sincronización exitosa.
  ///
  /// Parámetros:
  /// - [timestamp]: momento en que se completó la sincronización.
  Future<void> updateLastSync(DateTime timestamp) async {
    final config = await getOrDefaults();
    config.lastSyncTimestamp = timestamp;
    await _isar.writeTxn(() async {
      await _isar.configuracionSchemas.put(config);
    });
  }

  /// Actualiza el tema oscuro/claro.
  ///
  /// Parámetros:
  /// - [value]: true para tema oscuro, false para tema claro.
  Future<void> setTemaOscuro(bool value) async {
    final config = await getOrDefaults();
    config.temaOscuro = value;
    await _isar.writeTxn(() async {
      await _isar.configuracionSchemas.put(config);
    });
  }

  /// Actualiza las ligas favoritas del usuario.
  ///
  /// Parámetros:
  /// - [ligasIds]: lista de IDs externos de ligas seleccionadas como favoritas.
  Future<void> setLigasFavoritas(List<int> ligasIds) async {
    final config = await getOrDefaults();
    config.ligasFavoritasIds = ligasIds;
    await _isar.writeTxn(() async {
      await _isar.configuracionSchemas.put(config);
    });
  }
}
