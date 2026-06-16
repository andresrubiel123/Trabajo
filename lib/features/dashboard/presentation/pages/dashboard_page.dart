/// Pantalla de inicio del panel de control de apuestas.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/neon_button.dart';
import '../../../../core/widgets/gradient_text.dart';
import '../../../../core/widgets/shimmer_text.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ────────────────────────────────────────────────────
          _DashboardHeader(),
          const SizedBox(height: 28),

          // ── Stats Cards ───────────────────────────────────────────────
          _StatsGrid(),
          const SizedBox(height: 28),

          // ── Quick Actions ─────────────────────────────────────────────
          const GradientText('ACCIONES RÁPIDAS', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1)),
          const SizedBox(height: 12),
          _QuickActions(),
          const SizedBox(height: 28),

          // ── Tip del día ───────────────────────────────────────────────
          _TipCard(),
        ],
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hour = now.hour;
    String greeting;
    if (hour < 12) {
      greeting = '¡Buenos días!';
    } else if (hour < 18) {
      greeting = '¡Buenas tardes!';
    } else {
      greeting = '¡Buenas noches!';
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.premiumBlue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.premiumBlue.withValues(alpha: 0.3)),
          ),
          child: const Icon(Icons.home_rounded, color: AppColors.premiumBlue, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerText(greeting, style: AppTypography.bodySmall),
              const SizedBox(height: 4),
              ShimmerText('Dashboard', style: AppTypography.displaySmall),
              const SizedBox(height: 4),
              ShimmerText(
                'Bienvenido al Combinador Profesional de Apuestas Deportivas',
                style: AppTypography.bodyMedium
                    .copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
        // Live indicator
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.greenNeon.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.greenNeon.withValues(alpha: 0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.greenNeon,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.greenNeon.withValues(alpha: 0.5),
                        blurRadius: 6),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'SISTEMA ACTIVO',
                style: AppTypography.labelSmall
                    .copyWith(color: AppColors.greenNeon),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stats = [
      _StatData(
          label: 'Sesiones Hoy',
          value: '0',
          icon: Icons.today_rounded,
          color: AppColors.primary),
      _StatData(
          label: 'Total Combinaciones',
          value: '0',
          icon: Icons.grid_view_rounded,
          color: AppColors.amber),
      _StatData(
          label: 'Partidos Procesados',
          value: '0',
          icon: Icons.sports_soccer_rounded,
          color: AppColors.greenNeon),
      _StatData(
          label: 'Exportaciones',
          value: '0',
          icon: Icons.download_rounded,
          color: AppColors.secondary),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.4,
      ),
      itemCount: stats.length,
      itemBuilder: (context, i) => _StatCardWidget(data: stats[i]),
    );
  }
}

class _StatData {
  const _StatData({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });
  final String label;
  final String value;
  final IconData icon;
  final Color color;
}

class _StatCardWidget extends StatelessWidget {
  const _StatCardWidget({required this.data});
  final _StatData data;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      glowColor: data.color,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: data.color.withAlpha(26),
              borderRadius: BorderRadius.circular(12),
              border:
                  Border.all(color: data.color.withAlpha(77), width: 0.5),
            ),
            child: Icon(data.icon, color: data.color, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.value,
                  style: AppTypography.headlineLarge
                      .copyWith(color: data.color),
                ),
                Text(data.label, style: AppTypography.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: NeonButton(
            label: 'NUEVA SESIÓN',
            icon: Icons.add_rounded,
            onPressed: () => context.go(AppRoutes.combinaciones),
            height: 48,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: NeonButton(
            label: 'VER HISTORIAL',
            icon: Icons.history_rounded,
            onPressed: () => context.go(AppRoutes.historial),
            isOutlined: true,
            color: AppColors.secondary,
            height: 48,
          ),
        ),
      ],
    );
  }
}

class _TipCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderColor: AppColors.goldNeon.withAlpha(77),
      glowColor: AppColors.goldNeon,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lightbulb_outline_rounded,
              color: AppColors.goldNeon, size: 24),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GradientText(
                  'CONSEJO DEL DÍA',
                  style: TextStyle(color: AppColors.goldNeon, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
                const SizedBox(height: 6),
                Text(
                  'Usa la opción de resultado fijo (L/E/V) para los partidos '
                  'donde tienes más certeza. Esto reduce exponencialmente '
                  'el número de combinaciones y enfoca tu análisis.',
                  style: AppTypography.bodyMedium
                      .copyWith(color: AppColors.textSecondary, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
