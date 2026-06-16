/// Diseño de la estructura principal y contenedor de la interfaz de usuario.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'bottom_nav_bar.dart';
import 'nav_rail.dart';
import 'responsive_layout.dart';

/// Layout principal: selecciona automáticamente el layout correcto según
/// el ancho de pantalla disponible.
///
/// - **Mobile** (`< 600px`): [AppBottomNavBar] — sin sidebar.
/// - **Tablet** (`600–1023px`): [AppNavRail] colapsado (íconos) + contenido.
/// - **Desktop** (`>= 1024px`): [AppNavRail] expandido + contenido.
class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      // ── Mobile: BottomNavigationBar ─────────────────────────────────────
      mobile: AppBottomNavBar(child: child),

      // ── Tablet: NavRail forzado en colapsado (solo íconos) ─────────────
      tablet: _SidebarLayout(forceCollapsed: true, child: child),

      // ── Desktop: NavRail expandido con botón de colapsar ────────────────
      desktop: _SidebarLayout(forceCollapsed: false, child: child),
    );
  }
}

// ── Layout con sidebar lateral ───────────────────────────────────────────────

class _SidebarLayout extends StatelessWidget {
  const _SidebarLayout({
    required this.child,
    required this.forceCollapsed,
  });

  final Widget child;
  final bool forceCollapsed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          // ── Panel de navegación izquierdo ──────────────────────────────
          AppNavRail(forceCollapsed: forceCollapsed),

          // ── Área de contenido principal ────────────────────────────────
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: AppColors.backgroundGradient,
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
