/// Campo de texto personalizado con estilo futurista.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_typography.dart';

/// Campo de texto con estilo futurista / cyber.
class CyberTextField extends StatelessWidget {
  const CyberTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.onSubmitted,
    this.validator,
    this.focusNode,
    this.accentColor,
    this.maxLength,
    this.enabled = true,
  });

  final TextEditingController controller;
  final String label;
  final String? hint;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final Color? accentColor;
  final int? maxLength;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final accent = accentColor ?? AppColors.cyanNeon;

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      focusNode: focusNode,
      maxLength: maxLength,
      enabled: enabled,
      style: AppTypography.bodyMedium,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: accent, size: 20)
            : null,
        suffixIcon: suffixIcon,
        labelStyle: AppTypography.labelMedium.copyWith(color: accent),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: accent, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        filled: true,
        fillColor: AppColors.glassWhite,
        counterStyle: AppTypography.labelSmall,
      ),
    );
  }
}
