/// Pantalla de historial de combinaciones guardadas.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/shimmer_text.dart';

class HistorialPage extends StatelessWidget {
  const HistorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.premiumBlue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.premiumBlue.withValues(alpha: 0.3)),
                ),
                child: const Icon(Icons.history_rounded,
                    color: AppColors.premiumBlue, size: 24),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerText('Historial', style: AppTypography.headlineLarge),
                  const SizedBox(height: 4),
                  ShimmerText('Sesiones guardadas',
                      style: AppTypography.bodySmall),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Center(
              child: GlassCard(
                width: 400,
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.history_outlined,
                        size: 64, color: AppColors.textMuted),
                    const SizedBox(height: 16),
                    Text(
                      'Historial vacío',
                      style: AppTypography.headlineSmall
                          .copyWith(color: AppColors.textSecondary),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Las sesiones generadas aparecerán aquí.\nEsta funcionalidad estará disponible pronto.',
                      style: AppTypography.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
