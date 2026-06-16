/// Pantalla de ajustes y perfil de usuario de la aplicación.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/neon_button.dart';
import '../../../../core/widgets/gradient_text.dart';
import '../../../../core/widgets/shimmer_text.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../widgets/editar_usuario_dialog.dart';

class ConfiguracionPage extends ConsumerWidget {
  const ConfiguracionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.premiumBlue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.premiumBlue.withValues(alpha: 0.3)),
                ),
                child: const Icon(Icons.settings_rounded,
                    color: AppColors.premiumBlue, size: 24),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerText('Configuración', style: AppTypography.headlineLarge),
                  const SizedBox(height: 4),
                  ShimmerText('Ajustes de la aplicación',
                      style: AppTypography.bodySmall),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Perfil del usuario
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GradientText('PERFIL', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.person_rounded,
                          color: Colors.white, size: 24),
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(auth.username ?? 'Usuario',
                            style: AppTypography.bodyLarge),
                        Text('Administrador',
                            style: AppTypography.bodySmall),
                      ],
                    ),
                    const Spacer(),
                    NeonButton(
                      label: 'EDITAR',
                      icon: Icons.edit_rounded,
                      height: 36,
                      fontSize: 12,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const EditarUsuarioDialog(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Info versión
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GradientText('INFORMACIÓN', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1)),
                const SizedBox(height: 16),
                _InfoRow('Versión', AppConstants.appVersion),
                _InfoRow('Plataforma', 'Flutter ${Theme.of(context).platform.name}'),
                _InfoRow('Motor de combinaciones',
                    'Producto Cartesiano + Filtro ≥${AppConstants.maxConsecutivosIguales} consecutivos'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Botón cerrar sesión
          NeonButton(
            label: 'CERRAR SESIÓN',
            icon: Icons.logout_rounded,
            onPressed: () => ref.read(authProvider.notifier).logout(),
            isOutlined: true,
            color: AppColors.redNeon,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow(this.label, this.value);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 180,
            child: Text(label,
                style: AppTypography.bodySmall
                    .copyWith(color: AppColors.textSecondary)),
          ),
          Expanded(
            child: Text(value,
                style: AppTypography.bodySmall
                    .copyWith(color: AppColors.textPrimary)),
          ),
        ],
      ),
    );
  }
}
