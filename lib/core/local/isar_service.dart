/// Servicio de inicialización y acceso a la base de datos local Isar.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
library;

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'schemas/escudo_bandera_schema.dart';
import 'schemas/liga_schema.dart';
import 'schemas/equipo_schema.dart';
import 'schemas/partido_local_schema.dart';
import 'schemas/jugador_schema.dart';
import 'schemas/favorito_schema.dart';
import 'schemas/configuracion_schema.dart';
import 'schemas/prediccion_guardada_schema.dart';

/// Gestiona el ciclo de vida de la instancia Isar y registra las 8 colecciones.
///
/// Uso en [main.dart]:
/// ```dart
/// final isar = await IsarService.init();
/// runApp(ProviderScope(
///   overrides: [isarProvider.overrideWithValue(isar)],
///   child: App(),
/// ));
/// ```
class IsarService {
  IsarService._();

  static Isar? _instance;

  /// Retorna la instancia activa de Isar.
  ///
  /// Lanza [StateError] si se llama antes de [init].
  static Isar get instance {
    assert(_instance != null, 'Debes llamar a IsarService.init() antes de usar instance.');
    return _instance!;
  }

  /// Inicializa Isar con las 8 colecciones de la app.
  ///
  /// Es idempotente: si ya existe una instancia abierta, la retorna sin abrir otra.
  ///
  /// Parámetros:
  /// - [inspector]: habilita Isar Inspector en modo debug.
  ///
  /// Retorna la instancia [Isar] lista para usar.
  static Future<Isar> init({bool inspector = false}) async {
    if (_instance != null && _instance!.isOpen) return _instance!;

    final dir = await getApplicationDocumentsDirectory();

    _instance = await Isar.open(
      [
        EscudoBanderaSchemaSchema,
        LigaSchemaSchema,
        EquipoSchemaSchema,
        PartidoLocalSchemaSchema,
        JugadorSchemaSchema,
        FavoritoSchemaSchema,
        ConfiguracionSchemaSchema,
        PrediccionGuardadaSchemaSchema,
      ],
      directory: dir.path,
      name: 'gol_saint',
      inspector: inspector,
    );

    return _instance!;
  }

  /// Cierra la instancia de Isar de forma segura.
  ///
  /// Debe llamarse únicamente al finalizar la aplicación o en tests.
  static Future<void> close() async {
    await _instance?.close();
    _instance = null;
  }
}
