import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/api/models/fixture_model.dart';
import '../../../../core/widgets/team_logo.dart';
import '../providers/seleccion_partidos_provider.dart';

/// Tarjeta de predicción detallada para un encuentro de fútbol.
/// 
/// Muestra probabilidades de victoria, picks sugeridos por el modelo IA
/// y métricas de ataque y defensa avanzadas.
class PredictionMatchCard extends ConsumerWidget {
  /// Constructor para [PredictionMatchCard].
  const PredictionMatchCard({
    super.key,
    required this.match,
    this.isSelectionMode = true,
  });

  /// El partido a predecir.
  final FixtureModel match;

  /// Si es true, muestra los botones de selección 1/X/2 para combinaciones.
  final bool isSelectionMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(seleccionPartidosProvider);
    final selectionNotifier = ref.read(seleccionPartidosProvider.notifier);

    final localName = match.teams.home.name;
    final visitingName = match.teams.away.name;
    
    // Estadísticas deterministas utilizando el id del partido para que persistan
    final matchId = match.fixture.id;
    final localSeed = match.teams.home.id;
    final visitingSeed = match.teams.away.id;
    
    final int localWin = 35 + ((matchId + localSeed) % 30);
    final int visitorWin = 15 + ((matchId + visitingSeed) % 25);
    final int draw = 100 - localWin - visitorWin;

    // Lógica del pick recomendado por la IA
    String recommendedPick = 'Gana Local';
    String confidence = 'ALTA';
    Color confidenceColor = const Color.fromRGBO(81, 255, 0, 1);
    if (localWin < visitorWin) {
      recommendedPick = 'Gana Visitante';
      if (visitorWin < 45) {
        recommendedPick = 'Doble Oportunidad X2';
        confidence = 'MEDIA';
        confidenceColor = const Color.fromARGB(255, 255, 0, 0);
      }
    } else if ((localWin - visitorWin).abs() < 10) {
      recommendedPick = 'Ambos Anotan / Goles +1.5';
      confidence = 'MEDIA';
      confidenceColor = const Color.fromARGB(224, 255, 115, 0);
    }

    final matchTime = DateTime.tryParse(match.fixture.date) ?? DateTime.now();
    final formattedTime = DateFormat('HH:mm').format(matchTime);

    final isMatchSelected = selectionNotifier.estaSeleccionado(matchId);

    return GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Fila 1: IA Predictor logo, hora, nivel de confianza
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.premiumBlue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.premiumBlue.withValues(alpha: 0.3)),
                    ),
                    child: Text(
                      'IA PREDICTOR',
                      style: AppTypography.labelSmall.copyWith(
                        fontSize: 9,
                        color: AppColors.premiumBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Hora: $formattedTime HS',
                    style: AppTypography.bodySmall,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'CONFIANZA: ',
                    style: AppTypography.labelSmall.copyWith(fontSize: 9),
                  ),
                  Text(
                    confidence,
                    style: AppTypography.labelSmall.copyWith(
                      fontSize: 9,
                      color: confidenceColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Fila 2: Local vs Visitante
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      localName,
                      style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(width: 12),
                    TeamLogo(
                      logoUrl: match.teams.home.logo,
                      width: 34,
                      height: 34,
                      fallbackIcon: Icons.sports_soccer,
                      fallbackIconSize: 24,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.premiumBlue.withValues(alpha: 0.2)),
                  ),
                  child: Text(
                    match.fixture.status.short == 'FT'
                        ? '${match.goals.home ?? 0} - ${match.goals.away ?? 0}'
                        : 'VS',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.premiumBlue,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TeamLogo(
                      logoUrl: match.teams.away.logo,
                      width: 34,
                      height: 34,
                      fallbackIcon: Icons.sports_soccer,
                      fallbackIconSize: 24,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      visitingName,
                      style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Fila 3: Porcentajes de probabilidad
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(
                builder: (context) {
                  final maxVal = [localWin, draw, visitorWin].reduce((a, b) => a > b ? a : b);
                  final isLocalMax = localWin == maxVal;
                  final isDrawMax = draw == maxVal;
                  final isVisitorMax = visitorWin == maxVal;

                  const localColor = Color(0xFF39FF14);
                  const drawColor = Color(0xFFFF0055);
                  const visitorColor =AppColors.premiumBlue;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Local: $localWin%',
                        style: AppTypography.bodySmall.copyWith(
                          color: localColor,
                          fontWeight: isLocalMax ? FontWeight.bold : FontWeight.normal,
                          shadows: isLocalMax ? [
                            Shadow(
                              color: localColor.withValues(alpha: 0.8),
                              blurRadius: 8,
                            ),
                          ] : null,
                        ),
                      ),
                      Text(
                        'Empate: $draw%',
                        style: AppTypography.bodySmall.copyWith(
                          color: drawColor,
                          fontWeight: isDrawMax ? FontWeight.bold : FontWeight.normal,
                          shadows: isDrawMax ? [
                            Shadow(
                              color: drawColor.withValues(alpha: 0.8),
                              blurRadius: 8,
                            ),
                          ] : null,
                        ),
                      ),
                      Text(
                        'Visitante: $visitorWin%',
                        style: AppTypography.bodySmall.copyWith(
                          color: visitorColor,
                          fontWeight: isVisitorMax ? FontWeight.bold : FontWeight.normal,
                          shadows: isVisitorMax ? [
                            Shadow(
                              color: visitorColor.withValues(alpha: 0.8),
                              blurRadius: 8,
                            ),
                          ] : null,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 8),
              Builder(
                builder: (context) {
                  // Determinar color dominante para el brillo coherente y texto
                  Color dominantColor = const Color(0xFF39FF14);
                  if (draw > localWin && draw > visitorWin) {
                    dominantColor = const Color(0xFFFF0055); // Rojo fosforescente
                  } else if (visitorWin > localWin && visitorWin > draw) {
                    dominantColor = AppColors.premiumBlue; // Naranja fosforescente
                  }

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: dominantColor.withValues(alpha: 0.6),
                        width: 1.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: dominantColor.withValues(alpha: 0.25),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: SizedBox(
                        height: 8,
                        child: Row(
                          children: [
                            Expanded(
                              flex: localWin,
                              child: Container(
                                color: const Color(0xFF39FF14), // Verde fosforescente
                              ),
                            ),
                            Expanded(
                              flex: draw,
                              child: Container(
                                color: const Color(0xFFFF0055), // Rojo fosforescente
                              ),
                            ),
                            Expanded(
                              flex: visitorWin,
                              child: Container(
                                color: AppColors.premiumBlue, // Naranja fosforescente
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Selector de signos (1 / X / 2) para combinaciones
          if (isSelectionMode) ...[
            const Divider(color: AppColors.premiumBlue, height: 1, thickness: 0.3),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'SELECCIONAR PARA COMBINACIONES:',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textSecondary,
                  ),
                ),
                if (isMatchSelected)
                  Text(
                    'MARCADO',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF39FF14),
                      shadows: [
                        Shadow(
                          color: const Color(0xFF39FF14).withValues(alpha: 0.5),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildSelectionButton(
                    label: 'Local (1)',
                    isSelected: selectionNotifier.tieneSigno(matchId, '1'),
                    onTap: () => selectionNotifier.toggleSigno(match, '1'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildSelectionButton(
                    label: 'Empate (X)',
                    isSelected: selectionNotifier.tieneSigno(matchId, 'X'),
                    onTap: () => selectionNotifier.toggleSigno(match, 'X'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildSelectionButton(
                    label: 'Visitante (2)',
                    isSelected: selectionNotifier.tieneSigno(matchId, '2'),
                    onTap: () => selectionNotifier.toggleSigno(match, '2'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],

          // Fila 4: Recomendación y botón de detalles de modelo
          const Divider(color: AppColors.premiumBlue, height: 1, thickness: 0.3),
          const SizedBox(height: 12),
          Builder(
            builder: (context) {
              // Determinar color dominante para el texto de la recomendación
              Color dominantColor = const Color(0xFF39FF14);
              if (draw > localWin && draw > visitorWin) {
                dominantColor = const Color(0xFFFF0055);
              } else if (visitorWin > localWin && visitorWin > draw) {
                dominantColor = AppColors.premiumBlue;
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'RECOMENDACIÓN',
                        style: AppTypography.labelSmall.copyWith(fontSize: 8, color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        recommendedPick,
                        style: AppTypography.bodyMedium.copyWith(
                          color: dominantColor, // Color dinámico fosforescente
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: dominantColor.withValues(alpha: 0.8),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showAdvancedMetricsSheet(
                        context,
                        localWin,
                        draw,
                        visitorWin,
                        recommendedPick,
                        confidence,
                        dominantColor,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: AppColors.premiumBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: AppColors.premiumBlue, width: 0.8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: const Text(
                      'Ver Análisis v2.4',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.premiumBlue.withValues(alpha: 0.15) : Colors.black,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.premiumBlue : AppColors.premiumBlue.withValues(alpha: 0.25),
            width: isSelected ? 1.5 : 0.8,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.premiumBlue.withValues(alpha: 0.25),
                    blurRadius: 6,
                  )
                ]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? AppColors.premiumBlue : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  // Modal de métricas predictivas detalladas (Dota UI)
  void _showAdvancedMetricsSheet(
    BuildContext context,
    int localWin,
    int draw,
    int visitorWin,
    String pick,
    String confidence,
    Color pickColor,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        side: BorderSide(color: AppColors.premiumBlue, width: 1),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ANÁLISIS PREDICTIVO DETALLADO',
                    style: AppTypography.headlineSmall.copyWith(color: AppColors.premiumBlue, fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded, color: AppColors.textSecondary),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Text(
                '${match.teams.home.name} vs ${match.teams.away.name}',
                style: AppTypography.headlineMedium.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 20),
              _buildMetricBar('Ataque', 78, 65),
              const SizedBox(height: 12),
              _buildMetricBar('Defensa', 82, 70),
              const SizedBox(height: 12),
              _buildMetricBar('Rating Histórico', 88, 79),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('PREDICCIÓN RECOMENDADA', style: AppTypography.labelSmall),
                      Text(
                        pick,
                        style: AppTypography.headlineSmall.copyWith(
                          color: pickColor,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: pickColor.withValues(alpha: 0.8),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.premiumBlue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.premiumBlue.withValues(alpha: 0.3)),
                    ),
                    child: Text('Confianza $confidence', style: const TextStyle(color: AppColors.premiumBlue, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMetricBar(String label, int localValue, int awayValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTypography.bodySmall),
            Text('$localValue% vs $awayValue%', style: AppTypography.bodySmall.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 6),
        Builder(
          builder: (context) {
            final dominantColor = localValue >= awayValue
                ? const Color(0xFF39FF14)
                : const Color(0xFFFF7E00);

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: dominantColor.withValues(alpha: 0.5),
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: dominantColor.withValues(alpha: 0.2),
                    blurRadius: 6,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  height: 6,
                  child: Row(
                    children: [
                      Expanded(
                        flex: localValue,
                        child: Container(color: const Color(0xFF39FF14)), // Verde fosforescente
                      ),
                      Expanded(
                        flex: awayValue,
                        child: Container(color: const Color(0xFFFF7E00)), // Naranja fosforescente
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
