/// Punto de inicio de ejecución de la aplicación Flutter e inicialización de servicios.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app.dart';
import 'core/constants/dev_flags.dart';
import 'core/local/isar_service.dart';
import 'core/local/providers/isar_providers.dart';
import 'core/local/seed/seed_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar formateo de fechas en español
  await initializeDateFormatting('es', null);

  // Inicializar Isar con las 8 colecciones (única BD local)
  final isar = await IsarService.init(
    inspector: kIsarInspector,
  );

  // Aplicar datos seed si es el primer inicio o hay una versión nueva
  await SeedService(isar).apply();

  runApp(
    ProviderScope(
      overrides: [
        // Inyectar la instancia de Isar a todos los providers que la necesiten
        isarProvider.overrideWithValue(isar),
      ],
      child: const ApuestasFutbolApp(),
    ),
  );
}
