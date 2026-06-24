import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/gradient_text.dart';
import '../../../../core/widgets/shimmer_text.dart';
import '../../../../core/api/providers/football_providers.dart';
import '../../../../core/api/models/fixture_model.dart';
import '../../../../core/api/services/football_service.dart';
import '../../../../core/widgets/dota_calendar.dart';
import '../../../../core/widgets/rive_loader.dart';
import '../../../../core/widgets/team_logo.dart';
import '../widgets/prediction_match_card.dart';

/// Pantalla principal para visualizar predicciones y métricas de partidos próximos.
class PrediccionesPage extends ConsumerStatefulWidget {
  /// Constructor para [PrediccionesPage].
  const PrediccionesPage({super.key});

  @override
  ConsumerState<PrediccionesPage> createState() => _PrediccionesPageState();
}

class _PrediccionesPageState extends ConsumerState<PrediccionesPage> {
  CompetitionModel? _selectedLeague;
  late int _selectedSeason;
  late DateTime _selectedDate;
  late DateTime _currentMonth;
  bool _hasClickedCalendarDate = false;

  @override
  void initState() {
    super.initState();
    _selectedSeason = 2025;
    _selectedDate = DateTime.now();
    _currentMonth = DateTime(_selectedDate.year, _selectedDate.month);
  }

  @override
  Widget build(BuildContext context) {
    final competitionsAsync = ref.watch(competitionsProvider);

    if (competitionsAsync.value != null && competitionsAsync.value!.isNotEmpty && _selectedLeague == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final copaMundial = competitionsAsync.value!.firstWhere(
          (c) => c.name.toLowerCase().contains('copa mundial') || 
                 c.name.toLowerCase().contains('world cup') ||
                 c.name.toLowerCase().contains('mundial'),
          orElse: () => competitionsAsync.value!.first,
        );
        setState(() {
          _selectedLeague = copaMundial;
        });
      });
    }

    final fixtureParams = FixtureParams(
      leagueId: _selectedLeague?.id ?? 0,
      season: _selectedSeason,
    );

    final fixturesAsync = ref.watch(fixturesProvider(fixtureParams));

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ─────────────────────────────────────────────────────────
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.premiumBlue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.premiumBlue.withValues(alpha: 0.3)),
                ),
                child: const Icon(Icons.electric_bolt_rounded, color: AppColors.premiumBlue, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerText(
                      'Predicciones Avanzadas',
                      style: AppTypography.headlineLarge.copyWith(fontSize: 22),
                    ),
                    const SizedBox(height: 4),
                    ShimmerText(
                      'Análisis inteligente y predicciones de próximos encuentros',
                      style: AppTypography.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // ── Split Layout ──────────────────────────────────────────────────
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isDesktop = constraints.maxWidth >= 850;
                
                if (isDesktop) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Panel izquierdo: Calendario y Ligas vertical
                      SizedBox(
                        width: 280,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            DotaCalendar(
                              selectedDate: _selectedDate,
                              currentMonth: _currentMonth,
                              isPastDisabled: true,
                              onDateSelected: (date) {
                                setState(() {
                                  _selectedDate = date;
                                  _hasClickedCalendarDate = true;
                                });
                              },
                              onMonthChanged: (month) {
                                setState(() {
                                  _currentMonth = month;
                                  _hasClickedCalendarDate = false;
                                });
                              },
                            ),
                            const SizedBox(height: 20),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: GradientText(
                                'TORNEOS / LIGAS',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: _buildLeaguesVerticalList(competitionsAsync),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      // Panel derecho: Lista de Partidos
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'PRÓXIMOS PARTIDOS Y RESULTADOS',
                                    style: TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        _hasClickedCalendarDate
                                            ? 'Día: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}'
                                            : 'Mes: ${DateFormat('MMMM yyyy', 'es').format(_currentMonth)}',
                                        style: const TextStyle(
                                          color: AppColors.premiumBlue,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      if (_hasClickedCalendarDate) ...[
                                        const SizedBox(width: 8),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _hasClickedCalendarDate = false;
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: AppColors.premiumBlue.withValues(alpha: 0.15),
                                              borderRadius: BorderRadius.circular(4),
                                              border: Border.all(color: AppColors.premiumBlue.withValues(alpha: 0.3)),
                                            ),
                                            child: const Text(
                                              'Ver Mes',
                                              style: TextStyle(
                                                color: AppColors.premiumBlue,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              child: _buildMatchesList(fixturesAsync),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  // Adaptabilidad móvil
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DotaCalendar(
                          selectedDate: _selectedDate,
                          currentMonth: _currentMonth,
                          isPastDisabled: true,
                          onDateSelected: (date) {
                            setState(() {
                              _selectedDate = date;
                              _hasClickedCalendarDate = true;
                            });
                          },
                          onMonthChanged: (month) {
                            setState(() {
                              _currentMonth = month;
                              _hasClickedCalendarDate = false;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        _buildLeaguesHorizontalList(competitionsAsync),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'PARTIDOS Y RESULTADOS',
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  _hasClickedCalendarDate
                                      ? DateFormat('dd/MM/yyyy').format(_selectedDate)
                                      : DateFormat('MMMM yyyy', 'es').format(_currentMonth),
                                  style: const TextStyle(
                                    color: AppColors.premiumBlue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (_hasClickedCalendarDate) ...[
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _hasClickedCalendarDate = false;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: AppColors.premiumBlue.withValues(alpha: 0.15),
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(color: AppColors.premiumBlue.withValues(alpha: 0.3)),
                                      ),
                                      child: const Text(
                                        'Ver Mes',
                                        style: TextStyle(
                                          color: AppColors.premiumBlue,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 500,
                          child: _buildMatchesList(fixturesAsync),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // Lista de competiciones vertical (Escritorio)
  Widget _buildLeaguesVerticalList(AsyncValue<List<CompetitionModel>> competitionsAsync) {
    return competitionsAsync.when(
      data: (leagues) {
        if (leagues.isEmpty) {
          return const Text('No hay competiciones disponibles.', style: TextStyle(color: AppColors.textSecondary));
        }
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: leagues.length,
          itemBuilder: (context, index) {
            final league = leagues[index];
            final isSelected = _selectedLeague?.id == league.id;

            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedLeague = league;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? AppColors.premiumBlue : AppColors.premiumBlue.withValues(alpha: 0.15),
                      width: isSelected ? 1.5 : 0.8,
                    ),
                    boxShadow: isSelected
                        ? [BoxShadow(color: AppColors.premiumBlue.withValues(alpha: 0.2), blurRadius: 6)]
                        : null,
                  ),
                  child: Row(
                    children: [
                      TeamLogo(
                        logoUrl: league.logo,
                        width: 20,
                        height: 20,
                        fallbackIcon: Icons.sports_soccer,
                        fallbackIconSize: 16,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GradientText(
                          league.name,
                          style: AppTypography.labelLarge.copyWith(
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      loading: () => const RiveLoader(
        width: 80,
        height: 80,
        message: 'Cargando torneos...',
      ),
      error: (err, stack) => const SizedBox(),
    );
  }

  // Lista de competiciones horizontal (Móvil)
  Widget _buildLeaguesHorizontalList(AsyncValue<List<CompetitionModel>> competitionsAsync) {
    return competitionsAsync.when(
      data: (leagues) {
        if (leagues.isEmpty) return const SizedBox();
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: leagues.map((league) {
              final isSelected = _selectedLeague?.id == league.id;
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedLeague = league;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black,
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
                        TeamLogo(
                          logoUrl: league.logo,
                          width: 20,
                          height: 20,
                          fallbackIcon: Icons.sports_soccer,
                          fallbackIconSize: 16,
                        ),
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
                ),
              );
            }).toList(),
          ),
        );
      },
      loading: () => const RiveLoader(
        width: 80,
        height: 80,
        message: 'Cargando ligas...',
      ),
      error: (err, stack) => const SizedBox(),
    );
  }

  // Lista de partidos próximos o resultados filtrados por fecha/mes
  Widget _buildMatchesList(AsyncValue<List<FixtureModel>> fixturesAsync) {
    return fixturesAsync.when(
      data: (fixtures) {
        final filteredMatches = fixtures.where((f) {
          final matchDateStr = f.fixture.date;
          final matchDate = DateTime.tryParse(matchDateStr) ?? DateTime.now();
          
          if (_hasClickedCalendarDate) {
            return matchDate.year == _selectedDate.year &&
                matchDate.month == _selectedDate.month &&
                matchDate.day == _selectedDate.day;
          } else {
            return matchDate.year == _currentMonth.year &&
                matchDate.month == _currentMonth.month;
          }
        }).toList();

        // Ordenar cronológicamente
        filteredMatches.sort((a, b) {
          final dateA = DateTime.tryParse(a.fixture.date) ?? DateTime.now();
          final dateB = DateTime.tryParse(b.fixture.date) ?? DateTime.now();
          return dateA.compareTo(dateB);
        });

        if (filteredMatches.isEmpty) {
          final dateInfo = _hasClickedCalendarDate
              ? DateFormat('dd/MM/yyyy').format(_selectedDate)
              : DateFormat('MMMM yyyy', 'es').format(_currentMonth);

          return Center(
            child: GlassCard(
              width: 450,
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.event_busy_rounded, size: 48, color: AppColors.premiumBlue.withValues(alpha: 0.6)),
                  const SizedBox(height: 16),
                  Text(
                    'No hay partidos',
                    style: AppTypography.headlineSmall.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'No se encontraron partidos para $dateInfo en esta competición.',
                    style: AppTypography.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: filteredMatches.length,
          itemBuilder: (context, index) {
            final match = filteredMatches[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: PredictionMatchCard(match: match),
            );
          },
        );
      },
      loading: () => const RiveLoader(
        width: 120,
        height: 120,
        message: 'Cargando partidos...',
      ),
      error: (err, stack) => Text('Error al cargar partidos: $err', style: const TextStyle(color: Colors.red)),
    );
  }
}
