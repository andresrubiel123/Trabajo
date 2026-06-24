/// Provider raíz de Isar para inyección con Riverpod.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-17
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

/// Provider que expone la instancia de Isar inicializada en [main.dart].
///
/// Se inyecta mediante override en [ProviderScope]:
/// ```dart
/// ProviderScope(
///   overrides: [isarProvider.overrideWithValue(isar)],
///   child: App(),
/// )
/// ```
/// Lanza [UnimplementedError] si se usa sin el override — falla en compilación, no en runtime.
final isarProvider = Provider<Isar>(
  (ref) => throw UnimplementedError(
    'isarProvider debe ser sobreescrito con IsarService.init() en main.dart',
  ),
);
