import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/neon_button.dart';
import '../../../../core/widgets/shimmer_text.dart';
import '../providers/premium_provider.dart';
import '../widgets/payment_gateway_dialog.dart';

/// Pantalla promocional y de gestión para la suscripción VIP/Premium.
class PremiumPage extends ConsumerWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final premiumState = ref.watch(premiumSubscriptionProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Cabecera VIP
              _buildCrownIcon(),
              const SizedBox(height: 16),
              ShimmerText(
                'GOL SAINT VIP',
                style: AppTypography.headlineLarge.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                premiumState.isPremiumActive
                    ? '¡Tu suscripción VIP está activa y al máximo!'
                    : 'Desbloquea el poder absoluto de la predicción y el análisis',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Contenido condicional
              if (premiumState.isPremiumActive)
                _buildActiveVipView(context, ref)
              else
                _buildBenefitsListView(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCrownIcon() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD700).withValues(alpha: 0.1),
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFFFFD700).withValues(alpha: 0.4),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFD700).withValues(alpha: 0.2),
            blurRadius: 32,
            spreadRadius: 4,
          )
        ],
      ),
      child: const Icon(
        Icons.workspace_premium_rounded,
        size: 52,
        color: Color(0xFFFFD700),
      ),
    );
  }

  Widget _buildBenefitsListView(BuildContext context) {
    return Column(
      children: [
        _BenefitCard(
          title: 'Combinaciones sin límites',
          description: 'Genera y exporta hasta 100,000 combinaciones en simultáneo sin restricciones locales.',
          icon: Icons.auto_awesome_rounded,
          color: AppColors.premiumBlue,
        ),
        const SizedBox(height: 16),
        _BenefitCard(
          title: 'Predicciones IA con +75% de acierto',
          description: 'Acceso a las métricas ultra-avanzadas del modelo predictivo neuronal en vivo.',
          icon: Icons.psychology_rounded,
          color: const Color(0xFF39FF14),
        ),
        const SizedBox(height: 16),
        _BenefitCard(
          title: 'Sincronización prioritaria VIP',
          description: 'Recibe antes que nadie alineaciones oficiales, estado físico de jugadores y cuotas actualizadas.',
          icon: Icons.sync_rounded,
          color: const Color(0xFFFF00FF),
        ),
        const SizedBox(height: 40),
        
        // Botón de compra VIP
        NeonButton(
          label: 'ACTIVAR MEMBRESÍA — \$4.99/MES',
          icon: Icons.stars_rounded,
          onPressed: () => _openPaymentGateway(context),
          width: double.infinity,
          height: 54,
        ),
        const SizedBox(height: 16),
        const Text(
          'Cancela en cualquier momento desde Google Play. Pago 100% seguro.',
          style: TextStyle(fontSize: 11, color: AppColors.textMuted),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildActiveVipView(BuildContext context, WidgetRef ref) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      glowColor: const Color(0xFFFFD700),
      child: Column(
        children: [
          const Icon(
            Icons.verified_user_rounded,
            size: 48,
            color: Color(0xFF39FF14),
          ),
          const SizedBox(height: 16),
          const Text(
            'MIEMBRO PRO ACTIVO',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFD700),
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Tienes acceso ilimitado a todas las funciones premium de combinaciones de fútbol y estadísticas de la IA.',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textPrimary,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          const Divider(color: AppColors.border, height: 1),
          const SizedBox(height: 24),
          
          // Botón para cancelar membresía (solo para pruebas)
          TextButton(
            onPressed: () {
              ref.read(premiumSubscriptionProvider.notifier).cancelPremium();
            },
            child: const Text(
              'CANCELAR MEMBRESÍA VIP',
              style: TextStyle(
                color: AppColors.error,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openPaymentGateway(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const PaymentGatewayDialog(),
    );
  }
}

class _BenefitCard extends StatelessWidget {
  const _BenefitCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      glowColor: color.withValues(alpha: 0.15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: color.withValues(alpha: 0.3),
                width: 0.8,
              ),
            ),
            child: Icon(
              icon,
              size: 20,
              color: color,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.labelLarge.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
