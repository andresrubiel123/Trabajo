/// Sistema de diseño responsivo con tres breakpoints: mobile, tablet y desktop.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

/// Widget que selecciona el layout adecuado según el ancho disponible.
///
/// - `< 600px`   → [mobile] (BottomNavigationBar)
/// - `600–1023px`→ [tablet] (NavRail colapsado)
/// - `>= 1024px` → [desktop] (NavRail expandido)
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width < AppConstants.mobileBreakpoint) {
          return mobile;
        }

        if (width < AppConstants.tabletBreakpoint) {
          return tablet;
        }

        return desktop;
      },
    );
  }

  // ── Helpers estáticos ──────────────────────────────────────────────────

  /// Retorna `true` si el ancho actual es mobile (`< 600px`).
  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width < AppConstants.mobileBreakpoint;
  }

  /// Retorna `true` si el ancho actual es tablet (`600–1023px`).
  static bool isTablet(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return w >= AppConstants.mobileBreakpoint && w < AppConstants.tabletBreakpoint;
  }

  /// Retorna `true` si el ancho actual es desktop (`>= 1024px`).
  static bool isDesktop(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= AppConstants.tabletBreakpoint;
  }
}
