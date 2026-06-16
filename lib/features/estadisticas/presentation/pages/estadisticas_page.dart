import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/api/providers/football_providers.dart';
import '../../../../core/api/models/fixture_model.dart';
import '../../../../core/api/services/football_service.dart';
import '../../../../core/widgets/gradient_text.dart';
import '../../../../core/widgets/shimmer_text.dart';

class EstadisticasPage extends ConsumerStatefulWidget {
  const EstadisticasPage({super.key});

  @override
  ConsumerState<EstadisticasPage> createState() => _EstadisticasPageState();
}

class _EstadisticasPageState extends ConsumerState<EstadisticasPage> {
  CompetitionModel? _selectedLeague;
  late int _selectedSeason;

  @override
  void initState() {
    super.initState();
    _selectedSeason = 2025; // Default season
  }

  @override
  Widget build(BuildContext context) {
    // Consumimos el provider de competiciones del backend
    final competitionsAsync = ref.watch(competitionsProvider);

    // Si ya cargaron las ligas y no hay una seleccionada, selecciona la primera
    if (competitionsAsync.value != null && competitionsAsync.value!.isNotEmpty && _selectedLeague == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _selectedLeague = competitionsAsync.value!.first;
        });
      });
    }

    // Parámetros para la consulta de partidos
    final fixtureParams = FixtureParams(
      leagueId: _selectedLeague?.id ?? 0,
      season: _selectedSeason,
    );

    // Consumimos el provider de partidos
    final fixturesAsync = ref.watch(fixturesProvider(fixtureParams));

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header de la pantalla ──────────────────────────────────────────
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.premiumBlue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.premiumBlue.withValues(alpha: 0.3)),
                ),
                child: const Icon(Icons.bar_chart_rounded, color: AppColors.premiumBlue, size: 24),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerText(
                    'Historial de Partidos Finalizados',
                    style: AppTypography.headlineLarge.copyWith(fontSize: 22),
                  ),
                  const SizedBox(height: 4),
                  ShimmerText(
                    'Resutados y prediciones de partidos finalizados',
                    style: AppTypography.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // ── Selector de ligas populares (con Wrap para evitar desbordes) ────
          competitionsAsync.when(
            data: (leagues) {
              if (leagues.isEmpty) {
                return const Text('No hay competiciones disponibles.', style: TextStyle(color: AppColors.textSecondary));
              }
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: leagues.map((league) {
                  final isSelected = _selectedLeague?.id == league.id;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedLeague = league;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black, // Fondo negro puro
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? AppColors.premiumBlue : AppColors.premiumBlue.withValues(alpha: 0.3),
                          width: isSelected ? 1.5 : 0.8,
                        ),
                        boxShadow: isSelected
                            ? [BoxShadow(color: AppColors.premiumBlue.withValues(alpha: 0.3), blurRadius: 8)]
                            : null,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (league.logo != null)
                            Image.network(
                              league.logo!,
                              width: 20,
                              height: 20,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.sports_soccer, size: 16, color: AppColors.textSecondary),
                            )
                          else
                            const Icon(Icons.sports_soccer, size: 16, color: AppColors.textSecondary),
                          const SizedBox(width: 8),
                          GradientText(
                            league.name,
                            style: AppTypography.labelLarge.copyWith(
                              fontSize: 13,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator(color: AppColors.greenNeon)),
            error: (err, stack) => Text('Error al cargar ligas: $err', style: const TextStyle(color: Colors.red)),
          ),
          const SizedBox(height: 16),

          // ── Selector de Temporadas (Fecha actual 2026 hasta 2023) ───────────
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text('Temporada: ', style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary)),
                const SizedBox(width: 8),
                ...[2026, 2025, 2024, 2023].map((season) {
                  final isSelected = season == _selectedSeason;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(season.toString()),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _selectedSeason = season;
                          });
                        }
                      },
                      selectedColor: AppColors.greenNeon.withAlpha(51),
                      backgroundColor: AppColors.glassWhite,
                      labelStyle: TextStyle(
                        color: isSelected ? AppColors.greenNeon : AppColors.textPrimary,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                      side: BorderSide(
                        color: isSelected ? AppColors.greenNeon : AppColors.border,
                        width: 0.5,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // ── Resultados de partidos ──────────────────────────────────────────
          Expanded(
            child: fixturesAsync.when(
              data: (fixtures) {
                // Filtrar partidos desde la fecha actual (hoy) hacia atrás
                final now = DateTime.now();
                // Añadimos margen de 24 horas para cubrir diferencias de zona horaria y partidos en juego hoy
                final pastFixtures = fixtures.where((f) {
                  final matchDate = DateTime.fromMillisecondsSinceEpoch(f.fixture.timestamp * 1000);
                  return matchDate.isBefore(now.add(const Duration(hours: 24)));
                }).toList();

                if (pastFixtures.isEmpty) {
                  return Center(
                    child: GlassCard(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.info_outline_rounded, size: 48, color: AppColors.textMuted),
                          const SizedBox(height: 16),
                          Text('No se encontraron partidos', style: AppTypography.bodyLarge),
                          const SizedBox(height: 8),
                          Text('No hay partidos finalizados o en juego para esta temporada aún.', style: AppTypography.bodySmall),
                        ],
                      ),
                    ),
                  );
                }

                // Ordenar partidos de más reciente a más viejo (timestamp descendente)
                final sortedFixtures = List<FixtureModel>.from(pastFixtures)
                  ..sort((a, b) => b.fixture.timestamp.compareTo(a.fixture.timestamp));

                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: sortedFixtures.length,
                  itemBuilder: (context, index) {
                    final fixture = sortedFixtures[index];
                    return _buildFixtureCard(fixture);
                  },
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.greenNeon,
                ),
              ),
              error: (error, stackTrace) => Center(
                child: GlassCard(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.redNeon),
                      const SizedBox(height: 16),
                      Text('Error de conexión', style: AppTypography.bodyLarge.copyWith(color: AppColors.redNeon)),
                      const SizedBox(height: 8),
                      Text(
                        error.toString().contains('403') || error.toString().contains('Invalid API key')
                            ? 'Tu API Key de API-Football es incorrecta o no tiene acceso a esta liga.'
                            : 'No se pudieron cargar los datos de fútbol.',
                        style: AppTypography.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFixtureCard(FixtureModel fixture) {
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
                    color: statusColor.withAlpha(26),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: statusColor.withAlpha(100), width: 0.8),
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
