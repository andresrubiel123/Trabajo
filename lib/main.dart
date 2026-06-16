/// Punto de inicio de ejecución de la aplicación Flutter e inicialización de servicios.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';
import 'core/constants/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializar Hive para persistir datos locales
  await Hive.initFlutter();
  await Hive.openBox(AppConstants.userBox);

  runApp(
    const ProviderScope(
      child: ApuestasFutbolApp(),
    ),
  );
}
