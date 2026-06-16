/// Barra de navegación inferior para layouts mobile.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_colors.dart';
import '../routes/app_routes.dart';

/// Destinos de la barra de navegación inferior.
class _BottomNavDestination {
  const _BottomNavDestination({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.route,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
  final String route;
}

const _destinations = [
  _BottomNavDestination(
    label: 'Inicio',
    icon: Icons.dashboard_outlined,
    activeIcon: Icons.dashboard_rounded,
    route: AppRoutes.dashboard,
  ),
  _BottomNavDestination(
    label: 'Predicciones',
    icon: Icons.bolt_outlined,
    activeIcon: Icons.bolt_rounded,
    route: AppRoutes.predicciones,
  ),
  _BottomNavDestination(
    label: 'Generar',
    icon: Icons.auto_awesome_outlined,
    activeIcon: Icons.auto_awesome_rounded,
    route: AppRoutes.combinaciones,
  ),
  _BottomNavDestination(
    label: 'Historial',
    icon: Icons.history_outlined,
    activeIcon: Icons.history_rounded,
    route: AppRoutes.historial,
  ),
  _BottomNavDestination(
    label: 'Resultados',
    icon: Icons.bar_chart_outlined,
    activeIcon: Icons.bar_chart_rounded,
    route: AppRoutes.estadisticas,
  ),
  _BottomNavDestination(
    label: 'Config.',
    icon: Icons.settings_outlined,
    activeIcon: Icons.settings_rounded,
    route: AppRoutes.configuracion,
  ),
];

/// Barra de navegación inferior con estilo cyberpunk naranja/dark.
///
/// Se integra directamente con [go_router]: lee la ruta actual y navega
/// con [GoRouter.go] al pulsar cada destino.
class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).matchedLocation;
    final currentIndex = _indexForRoute(currentRoute);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: child,
      ),
      bottomNavigationBar: _buildBottomBar(context, currentIndex),
    );
  }

  int _indexForRoute(String route) {
    final index = _destinations.indexWhere((d) => d.route == route);
    return index < 0 ? 0 : index;
  }

  Widget _buildBottomBar(BuildContext context, int currentIndex) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: const Border(
          top: BorderSide(color: AppColors.border, width: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(120),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_destinations.length, (index) {
              return _BottomNavItem(
                destination: _destinations[index],
                isActive: index == currentIndex,
                onTap: () => context.go(_destinations[index].route),
              );
            }),
          ),
        ),
      ),
    );
  }
}

// ── Item individual ──────────────────────────────────────────────────────────

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.destination,
    required this.isActive,
    required this.onTap,
  });

  final _BottomNavDestination destination;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.primary : AppColors.navInactive;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Indicador activo (punto naranja)
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: isActive ? 24 : 0,
                height: isActive ? 2 : 0,
                margin: const EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(1),
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withAlpha(128),
                            blurRadius: 6,
                          )
                        ]
                      : null,
                ),
              ),
              Icon(
                isActive ? destination.activeIcon : destination.icon,
                color: color,
                size: 22,
              ),
              const SizedBox(height: 2),
              Text(
                destination.label,
                style: TextStyle(
                  color: color,
                  fontSize: 10,
                  fontWeight:
                      isActive ? FontWeight.w600 : FontWeight.w400,
                  letterSpacing: 0.2,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
