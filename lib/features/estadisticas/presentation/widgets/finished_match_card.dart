import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/api/models/fixture_model.dart';

/// Tarjeta para mostrar el resultado y estado de un partido finalizado o en curso.
class FinishedMatchCard extends StatelessWidget {
  /// Constructor para [FinishedMatchCard].
  const FinishedMatchCard({
    super.key,
    required this.fixture,
  });

  /// El partido a mostrar.
  final FixtureModel fixture;

  @override
  Widget build(BuildContext context) {
    // Formatear fecha
    final dateTime = DateTime.fromMillisecondsSinceEpoch(fixture.fixture.timestamp * 1000);
    final formattedTime = DateFormat('HH:mm').format(dateTime);
    final formattedDate = DateFormat('dd MMM, yyyy').format(dateTime);

    // Obtener badge de estado
    Color statusColor;
    String statusLabel = fixture.fixture.status.short;

    switch (fixture.fixture.status.short) {
      case 'FT':
        statusColor = AppColors.greenNeon;
        statusLabel = 'Final';
        break;
      case '1H':
      case '2H':
      case 'HT':
      case 'LIVE':
        statusColor = AppColors.redNeon;
        statusLabel = fixture.fixture.status.elapsed != null ? "${fixture.fixture.status.elapsed}'" : 'En Vivo';
        break;
      case 'NS':
        statusColor = AppColors.cyanNeon;
        statusLabel = 'Prog.';
        break;
      default:
        statusColor = AppColors.textSecondary;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GlassCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            // ── Fecha y Estado del Partido ─────────────────────────────
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(formattedTime, style: AppTypography.headlineMedium.copyWith(fontSize: 18, color: AppColors.textPrimary)),
                const SizedBox(height: 4),
                Text(formattedDate, style: AppTypography.labelSmall.copyWith(fontSize: 10, color: AppColors.textSecondary)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: statusColor.withValues(alpha: 0.4), width: 0.8),
                  ),
                  child: Text(
                    statusLabel,
                    style: AppTypography.labelSmall.copyWith(
                      color: statusColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            const SizedBox(
              height: 60,
              child: VerticalDivider(color: AppColors.border, width: 1),
            ),
            const SizedBox(width: 16),

            // ── Equipos y Marcadores ───────────────────────────────────
            Expanded(
              child: Column(
                children: [
                  // Equipo Local
                  Row(
                    children: [
                      Image.network(
                        fixture.teams.home.logo ?? '',
                        width: 24,
                        height: 24,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.shield, size: 20, color: AppColors.textSecondary),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          fixture.teams.home.name,
                          style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        fixture.goals.home != null ? fixture.goals.home.toString() : '-',
                        style: AppTypography.bodyLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          color: fixture.fixture.status.short == 'FT' ? AppColors.textPrimary : AppColors.cyanNeon,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Equipo Visitante
                  Row(
                    children: [
                      Image.network(
                        fixture.teams.away.logo ?? '',
                        width: 24,
                        height: 24,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.shield, size: 20, color: AppColors.textSecondary),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          fixture.teams.away.name,
                          style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        fixture.goals.away != null ? fixture.goals.away.toString() : '-',
                        style: AppTypography.bodyLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          color: fixture.fixture.status.short == 'FT' ? AppColors.textPrimary : AppColors.cyanNeon,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
