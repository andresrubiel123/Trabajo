/// Definiciones tipográficas y estilos de texto del sistema.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Sistema tipográfico — Space Grotesk
/// Moderna, con carácter único, técnica pero legible.
class AppTypography {
  AppTypography._();

  // ── Display / Títulos grandes ──────────────────────────────────────────
  static TextStyle get displayLarge => GoogleFonts.spaceGrotesk(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: -1.5,
        height: 1.1,
      );

  static TextStyle get displayMedium => GoogleFonts.spaceGrotesk(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: -1.0,
        height: 1.15,
      );

  static TextStyle get displaySmall => GoogleFonts.spaceGrotesk(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: -0.5,
        height: 1.2,
      );

  // ── Headings ───────────────────────────────────────────────────────────
  static TextStyle get headlineLarge => GoogleFonts.spaceGrotesk(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: -0.3,
      );

  static TextStyle get headlineMedium => GoogleFonts.spaceGrotesk(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: -0.2,
      );

  static TextStyle get headlineSmall => GoogleFonts.spaceGrotesk(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: -0.1,
      );

  // ── Body / Cuerpo ──────────────────────────────────────────────────────
  static TextStyle get bodyLarge => GoogleFonts.spaceGrotesk(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
        letterSpacing: -0.1,
        height: 1.5,
      );

  static TextStyle get bodyMedium => GoogleFonts.spaceGrotesk(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        letterSpacing: 0,
        height: 1.5,
      );

  static TextStyle get bodySmall => GoogleFonts.spaceGrotesk(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        letterSpacing: 0,
        height: 1.4,
      );

  // ── Labels ─────────────────────────────────────────────────────────────
  static TextStyle get labelLarge => GoogleFonts.spaceGrotesk(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: 0.3,
      );

  static TextStyle get labelMedium => GoogleFonts.spaceGrotesk(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
        letterSpacing: 0.2,
      );

  static TextStyle get labelSmall => GoogleFonts.spaceGrotesk(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.textMuted,
        letterSpacing: 0.5,
      );

  // ── Monospace (para combinaciones) ────────────────────────────────────
  static TextStyle get mono => GoogleFonts.spaceMono(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        letterSpacing: 0,
      );

  static TextStyle get monoAccent => GoogleFonts.spaceMono(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
        letterSpacing: 0,
      );

  // ── Accent / Naranja highlight ────────────────────────────────────────
  static TextStyle get neonCyan => GoogleFonts.spaceGrotesk(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
        letterSpacing: 1.5,
        shadows: [
          Shadow(color: AppColors.primary.withAlpha(100), blurRadius: 8),
        ],
      );

  static TextStyle get neonGreen => GoogleFonts.spaceGrotesk(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: AppColors.greenNeon,
        letterSpacing: 1.5,
        shadows: [
          Shadow(color: AppColors.greenNeon.withAlpha(100), blurRadius: 8),
        ],
      );

  // ── App brand / título principal ─────────────────────────────────────
  static TextStyle get brand => GoogleFonts.spaceGrotesk(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: -0.5,
      );

  static TextStyle get brandAccent => GoogleFonts.spaceGrotesk(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
        letterSpacing: 2.0,
      );
}
