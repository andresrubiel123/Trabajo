/// Widget tarjeta Copa del Mundo 2026 para el Dashboard.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-24
///
/// Muestra: estado de sincronización, próximos partidos y acceso a la pantalla completa.
library;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/local/providers/local_data_providers.dart';
import '../../../../core/local/schemas/partido_local_schema.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/gradient_text.dart';

/// Tarjeta resumen de Copa del Mundo para el Dashboard.
///
/// Muestra el conteo de partidos y hasta 3 próximos partidos.
/// Incluye botón de acceso a la pantalla completa del Mundial.
class MundialCard extends ConsumerWidget {
  const MundialCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countAsync = ref.watch(countPartidosMundialProvider);
    final proximosAsync = ref.watch(proximosPartidosMundialProvider);

    return GlassCard(
      glowColor: const Color(0xFF00A651), // verde FIFA
      borderColor: const Color(0xFF00A651).withAlpha(77),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ────────────────────────────────────────────────────
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00A651), Color(0xFF006400)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.emoji_events_rounded,
                    color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GradientText(
                      'COPA DEL MUNDO 2026',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                      ),
                    ),
                    countAsync.when(
                      data: (count) => Text(
                        'USA • Canadá • México  —  $count partidos en local',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 10,
                        ),
                      ),
                      loading: () => const Text('Cargando...'),
                      error: (_, _) => const Text('Sin datos'),
                    ),
                  ],
                ),
              ),
              // Badge "OFFLINE OK"
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.success.withAlpha(26),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: AppColors.success.withAlpha(77)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.offline_bolt_rounded,
                        color: AppColors.success, size: 12),
                    const SizedBox(width: 4),
                    Text(
                      'OFFLINE',
                      style: AppTypography.labelSmall.copyWith(
                        color: AppColors.success,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // ── Próximos partidos ──────────────────────────────────────────
          proximosAsync.when(
            data: (partidos) {
              if (partidos.isEmpty) {
                return _NoPartidosProximos();
              }
              return Column(
                children: partidos
                    .take(3)
                    .map((p) => _PartidoMiniCard(partido: p))
                    .toList(),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
            error: (_, _) => _NoPartidosProximos(),
          ),

          const SizedBox(height: 16),

          // ── Botón "Ver todos" ──────────────────────────────────────────
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => context.go(AppRoutes.mundial),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    color: Color(0xFF00A651), width: 1.5),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(Icons.sports_soccer_rounded,
                  color: Color(0xFF00A651), size: 18),
              label: const Text(
                'VER TODOS LOS PARTIDOS DEL MUNDIAL',
                style: TextStyle(
                  color: Color(0xFF00A651),
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PartidoMiniCard extends StatelessWidget {
  const _PartidoMiniCard({required this.partido});

  final PartidoLocalSchema partido;

  @override
  Widget build(BuildContext context) {
    final fecha =
        DateFormat('dd MMM • HH:mm', 'es').format(partido.fecha.toLocal());

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            // Bandera local
            _BanderaWidget(url: partido.banderaLocalUrl),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${partido.equipoLocalNombre} vs ${partido.equipoVisitanteNombre}',
                    style: AppTypography.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${partido.ronda ?? ''} • $fecha',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
            ),
            // Bandera visitante
            _BanderaWidget(url: partido.banderaVisitanteUrl),
          ],
        ),
      ),
    );
  }
}

class _BanderaWidget extends StatelessWidget {
  const _BanderaWidget({this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return Container(
        width: 28,
        height: 20,
        decoration: BoxDecoration(
          color: AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(4),
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: CachedNetworkImage(
        imageUrl: url!,
        width: 28,
        height: 20,
        fit: BoxFit.cover,
        errorWidget: (_, _, _) => Container(
          width: 28,
          height: 20,
          color: AppColors.surfaceElevated,
        ),
      ),
    );
  }
}

class _NoPartidosProximos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Text(
        '🏆 Todos los partidos ya se jugaron\n¡Revisa los resultados!',
        textAlign: TextAlign.center,
        style: AppTypography.bodySmall
            .copyWith(color: AppColors.textSecondary),
      ),
    );
  }
}
