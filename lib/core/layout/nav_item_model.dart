/// Modelo de datos para los elementos de navegación lateral.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter/material.dart';

/// Modelo de ítem de navegación del panel lateral.
class NavItemModel {
  const NavItemModel({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.route,
    this.accentColor,
    this.badge,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
  final String route;
  final Color? accentColor;
  final String? badge;
}
