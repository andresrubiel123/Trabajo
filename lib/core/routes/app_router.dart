/// Configuración de rutas y navegación de la aplicación con GoRouter.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/combinaciones/presentation/pages/combinaciones_page.dart';
import '../../features/configuracion/presentation/pages/configuracion_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/predicciones/presentation/pages/predicciones_page.dart';
import '../../features/estadisticas/presentation/pages/estadisticas_page.dart';
import '../../features/historial/presentation/pages/historial_page.dart';
import '../../features/premium/presentation/pages/premium_page.dart';
import '../../features/combinaciones/presentation/pages/mundial_partidos_page.dart';
import '../layout/main_layout.dart';
import 'app_routes.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: AppRoutes.login,
    redirect: (context, state) {
      final isLoggedIn = authState.isAuthenticated;
      final isLoginRoute = state.matchedLocation == AppRoutes.login;

      if (!isLoggedIn && !isLoginRoute) return AppRoutes.login;
      if (isLoggedIn && isLoginRoute) return AppRoutes.dashboard;
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainLayout(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.dashboard,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: DashboardPage(),
            ),
          ),
          GoRoute(
            path: AppRoutes.predicciones,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: PrediccionesPage(),
            ),
          ),
          GoRoute(
            path: AppRoutes.combinaciones,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: CombinacionesPage(),
            ),
          ),
          GoRoute(
            path: AppRoutes.historial,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HistorialPage(),
            ),
          ),
          GoRoute(
            path: AppRoutes.estadisticas,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: EstadisticasPage(),
            ),
          ),
          GoRoute(
            path: AppRoutes.configuracion,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ConfiguracionPage(),
            ),
          ),
          GoRoute(
            path: AppRoutes.premium,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: PremiumPage(),
            ),
          ),
          GoRoute(
            path: AppRoutes.mundial,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: MundialPartidosPage(),
            ),
          ),
        ],
      ),
    ],
  );
});
