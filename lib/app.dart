/// Punto de entrada y configuración de enrutamiento principal de la aplicación.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'core/routes/app_router.dart';

/// Punto de entrada de la aplicación ApuestasFutbol.
class ApuestasFutbolApp extends ConsumerWidget {
  const ApuestasFutbolApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'ApuestasFutbol',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: router,
    );
  }
}
