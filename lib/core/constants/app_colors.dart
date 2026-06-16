/// Paleta de colores y estilos visuales con estética cyberpunk de la aplicación.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter/material.dart';

/// Paleta de colores — ApuestasFutbol
/// Tema: Naranja Eléctrico + Fondo Dark profundo
class AppColors {
  AppColors._();

  // ── Fondos ──────────────────────────────────────────────────────────
  static const Color background = Color(0xFF0A0C0F);       // negro puro cálido
  static const Color surface = Color(0xFF111318);
  static const Color surfaceElevated = Color(0xFF181C23);
  static const Color cardBackground = Color(0xFF141720);

  // ── Acentos principales (naranja eléctrico) ──────────────────────────
  static const Color primary = Color(0xFFFF6B00);          // naranja eléctrico
  static const Color primaryLight = Color(0xFFFF8C38);     // naranja claro
  static const Color primaryDark = Color(0xFFCC5500);      // naranja oscuro
  static const Color secondary = Color(0xFFFF3D00);        // naranja rojo
  static const Color amber = Color(0xFFFFA726);            // ámbar dorado

  // ── Mantener compatibilidad con nombre anterior ────────────────────
  static const Color cyanNeon = primary;                   // renombramos pero compatibilidad
  static const Color purpleNeon = secondary;
  static const Color greenNeon = Color(0xFF10B981);        // verde esmeralda
  static const Color redNeon = Color(0xFFEF4444);          // rojo limpio
  static const Color orangeNeon = primary;
  static const Color goldNeon = amber;

  // ── Gradientes ────────────────────────────────────────────────────────
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient blueToOrangeGradient = LinearGradient(
    colors: [Color(0xFF0052FF), primary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient primaryGradientVertical = LinearGradient(
    colors: [primaryLight, primaryDark],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFF0A0C0F), Color(0xFF0F1117)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF161A24), Color(0xFF111318)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient navGradient = LinearGradient(
    colors: [Color(0xFF0D0F14), Color(0xFF080A0D)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient orangeGlow = LinearGradient(
    colors: [Color(0xFFFF6B00), Color(0xFFFF3D00)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ── Texto ─────────────────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFFF1F5F9);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textMuted = Color(0xFF2D3748);
  static const Color textOnAccent = Color(0xFFFFFFFF);     // blanco sobre naranja

  // ── Bordes / Divisores ────────────────────────────────────────────────
  static const Color border = Color(0xFF1E2130);
  static const Color borderAccent = Color(0xFFFF6B00);
  static const Color premiumBlue = Color(0xFF00D2FF);      // Azul Premium Neon

  // ── Glassmorphism ─────────────────────────────────────────────────────
  static const Color glassWhite = Color(0x0DFFFFFF);       // 5% white
  static const Color glassBorder = Color(0x3300D2FF);      // Borde fino de azul premium neon (20% opacidad)
  static const Color glassOrange = Color(0x0DFF6B00);      // 5% orange

  // ── Estado ───────────────────────────────────────────────────────────
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // ── Nav Rail ─────────────────────────────────────────────────────────
  static const Color navActive = primary;
  static const Color navInactive = Color(0xFF374151);
  static const Color navHover = Color(0x1AFF6B00);         // orange 10%
}
