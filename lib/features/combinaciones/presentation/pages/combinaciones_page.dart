/// Pantalla principal para configurar partidos y generar combinaciones.
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
import '../../../../core/widgets/shimmer_text.dart';
import '../../../../core/widgets/team_logo.dart';
import '../../../../core/widgets/rive_loader.dart';
import '../../../../core/api/models/fixture_model.dart';
import '../../../predicciones/presentation/providers/seleccion_partidos_provider.dart';
import '../../domain/entities/partido_entity.dart';
import '../providers/partidos_provider.dart';
import '../providers/combinaciones_provider.dart';
import '../widgets/partido_card.dart';
import '../widgets/combinaciones_table.dart';
import '../widgets/export_action_bar.dart';

class CombinacionesPage extends ConsumerStatefulWidget {
  const CombinacionesPage({super.key});

  @override
  ConsumerState<CombinacionesPage> createState() => _CombinacionesPageState();
}

class _CombinacionesPageState extends ConsumerState<CombinacionesPage>
    with SingleTickerProviderStateMixin {
  final _cantidadCtrl = TextEditingController();
  late TabController _tabController;
  bool _useCopaMundial = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _cantidadCtrl.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _crearPartidos() {
    final cantidad = int.tryParse(_cantidadCtrl.text) ?? 0;
    if (cantidad < AppConstants.minPartidos ||
        cantidad > AppConstants.maxPartidos) {
      _showSnack('Ingresa entre ${AppConstants.minPartidos} y '
          '${AppConstants.maxPartidos} partidos');
      return;
    }
    ref.read(partidosProvider.notifier).crearPartidos(cantidad);
    ref.read(combinacionesProvider.notifier).limpiar();
  }

  Future<void> _generarCombinaciones() async {
    final List<PartidoEntity> partidos;
    if (_useCopaMundial) {
      partidos = ref.read(seleccionPartidosProvider).comoListaPartidos;
      if (partidos.isEmpty) {
        _showSnack('Selecciona al menos un partido y un resultado para combinar');
        return;
      }
    } else {
      partidos = ref.read(partidosProvider);
      if (partidos.isEmpty) {
        _showSnack('Primero crea los partidos');
        return;
      }
    }
    await ref.read(combinacionesProvider.notifier).generar(partidos);
    if (_tabController.index == 0) {
      _tabController.animateTo(1);
    }
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final partidos = ref.watch(partidosProvider);
    final combState = ref.watch(combinacionesProvider);
    final totalPartidosCount = _useCopaMundial 
        ? ref.watch(seleccionPartidosProvider).totalPartidos 
        : partidos.length;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ───────────────────────────────────────────────────
          _PageHeader(partidosCount: totalPartidosCount),
          const SizedBox(height: 24),

          // ── Stats Row ────────────────────────────────────────────────
          if (combState.hasResults) ...[
            _StatsRow(state: combState),
            const SizedBox(height: 20),
          ],

          // ── Tabs ─────────────────────────────────────────────────────
          _buildTabBar(),
          const SizedBox(height: 16),

          // ── Tab Content ──────────────────────────────────────────────
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Tab 1: Configurar partidos
                _ConfigTab(
                  cantidadCtrl: _cantidadCtrl,
                  partidos: partidos,
                  onCrear: _crearPartidos,
                  onGenerar: _generarCombinaciones,
                  isGenerating: combState.isGenerating,
                  useCopaMundial: _useCopaMundial,
                  onToggleMode: (val) {
                    setState(() {
                      _useCopaMundial = val;
                    });
                  },
                ),
                // Tab 2: Resultados
                _ResultadosTab(state: combState),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.glassWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(10),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelStyle: AppTypography.labelLarge.copyWith(fontSize: 14),
        unselectedLabelStyle: AppTypography.labelMedium,
        labelColor: AppColors.textOnAccent,
        unselectedLabelColor: AppColors.textSecondary,
        tabs: const [
          Tab(text: 'Configurar'),
          Tab(text: 'Resultados'),
        ],
      ),
    );
  }
}

// ── Page Header ──────────────────────────────────────────────────────────────

class _PageHeader extends StatelessWidget {
  const _PageHeader({required this.partidosCount});
  final int partidosCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.premiumBlue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.premiumBlue.withValues(alpha: 0.3)),
          ),
          child: const Icon(
            Icons.auto_awesome_rounded,
            color: AppColors.premiumBlue,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerText('Generar Combinaciones', style: AppTypography.headlineLarge),
              const SizedBox(height: 4),
              ShimmerText(
                partidosCount > 0
                    ? '$partidosCount partidos configurados'
                    : 'Configura tus partidos y genera combinaciones',
                style: AppTypography.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Stats Row ────────────────────────────────────────────────────────────────

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.state});
  final CombinacionesState state;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    if (isMobile) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  label: 'COMBINACIONES',
                  value: '${state.totalFiltrado}',
                  color: AppColors.primary,
                  icon: Icons.grid_view_rounded,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _StatCard(
                  label: 'BRUTO',
                  value: '${state.totalBruto}',
                  color: AppColors.textSecondary,
                  icon: Icons.calculate_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _StatCard(
            label: 'FILTRADAS',
            value: '${state.combinacionesEliminadas}',
            color: AppColors.error,
            icon: Icons.filter_alt_outlined,
            isFullWidth: true,
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          child: _StatCard(
            label: 'COMBINACIONES',
            value: '${state.totalFiltrado}',
            color: AppColors.primary,
            icon: Icons.grid_view_rounded,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            label: 'BRUTO',
            value: '${state.totalBruto}',
            color: AppColors.textSecondary,
            icon: Icons.calculate_outlined,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            label: 'FILTRADAS',
            value: '${state.combinacionesEliminadas}',
            color: AppColors.error,
            icon: Icons.filter_alt_outlined,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
    this.isFullWidth = false,
  });

  final String label;
  final String value;
  final Color color;
  final IconData icon;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      glowColor: color,
      child: Row(
        mainAxisAlignment: isFullWidth ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  value,
                  style: AppTypography.headlineMedium.copyWith(color: color, fontSize: 16),
                ),
                Text(
                  label,
                  style: AppTypography.labelSmall.copyWith(fontSize: 9),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Config Tab ───────────────────────────────────────────────────────────────

class _ConfigTab extends ConsumerWidget {
  const _ConfigTab({
    required this.cantidadCtrl,
    required this.partidos,
    required this.onCrear,
    required this.onGenerar,
    required this.isGenerating,
    required this.useCopaMundial,
    required this.onToggleMode,
  });

  final TextEditingController cantidadCtrl;
  final List partidos;
  final VoidCallback onCrear;
  final VoidCallback onGenerar;
  final bool isGenerating;
  final bool useCopaMundial;
  final ValueChanged<bool> onToggleMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (useCopaMundial) {
      final fixturesAsync = ref.watch(copaMundialFixturesProvider);
      final selectionState = ref.watch(seleccionPartidosProvider);

      return Column(
        children: [
          // Selector de Modo
          _buildModeSelector(),
          const SizedBox(height: 12),

          // Info de Selección & Limpiar
          GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SELECCIÓN COPA DEL MUNDO',
                      style: AppTypography.labelSmall.copyWith(color: AppColors.textSecondary, fontSize: 10),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${selectionState.totalPartidos} / ${AppConstants.maxPartidos} partidos (${selectionState.totalCombinaciones} comb.)',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.premiumBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                if (selectionState.tieneSeleccion)
                  TextButton.icon(
                    onPressed: () {
                      ref.read(seleccionPartidosProvider.notifier).limpiar();
                    },
                    icon: const Icon(Icons.delete_sweep_rounded, color: AppColors.redNeon, size: 18),
                    label: Text(
                      'LIMPIAR',
                      style: AppTypography.labelSmall.copyWith(color: AppColors.redNeon, fontSize: 11),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Lista de partidos de Copa Mundial
          Expanded(
            child: fixturesAsync.when(
              data: (fixtures) {
                if (fixtures.isEmpty) {
                  return const Center(
                    child: Text(
                      'No hay partidos de la Copa del Mundo disponibles.',
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: fixtures.length,
                  itemBuilder: (context, index) {
                    return _CopaPartidoCard(match: fixtures[index]);
                  },
                );
              },
              loading: () => const Center(
                child: RiveLoader(
                  width: 100,
                  height: 100,
                  message: 'Cargando partidos de la copa...',
                ),
              ),
              error: (err, stack) => Center(
                child: Text(
                  'Error al cargar partidos: $err',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Botón Generar
          NeonButton(
            label: 'GENERAR COMBINACIONES',
            icon: Icons.bolt_rounded,
            onPressed: onGenerar,
            isLoading: isGenerating,
            width: double.infinity,
            height: 54,
          ),
        ],
      );
    }

    // Modo manual original
    return Column(
      children: [
        // Selector de Modo
        _buildModeSelector(),
        const SizedBox(height: 12),

        // Input cantidad
        GlassCard(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: cantidadCtrl,
                  keyboardType: TextInputType.number,
                  style: AppTypography.bodyMedium,
                  decoration: InputDecoration(
                    labelText: 'Cantidad de partidos (1-${AppConstants.maxPartidos})',
                    prefixIcon: const Icon(Icons.sports_soccer_outlined,
                        color: AppColors.cyanNeon, size: 20),
                    labelStyle: AppTypography.labelMedium
                        .copyWith(color: AppColors.cyanNeon),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              NeonButton(
                label: 'CREAR',
                icon: Icons.add_rounded,
                onPressed: onCrear,
                width: 120,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Lista de partidos
        Expanded(
          child: partidos.isEmpty
              ? _EmptyPartidos()
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: partidos.length,
                  itemBuilder: (context, index) {
                    return PartidoCard(
                      partido: partidos[index],
                      indice: index + 1,
                    );
                  },
                ),
        ),
        const SizedBox(height: 12),

        // Botón Generar
        if (partidos.isNotEmpty)
          NeonButton(
            label: 'GENERAR COMBINACIONES',
            icon: Icons.bolt_rounded,
            onPressed: onGenerar,
            isLoading: isGenerating,
            width: double.infinity,
            height: 54,
          ),
      ],
    );
  }

  Widget _buildModeSelector() {
    return Container(
      height: 44,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.glassWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: _ModeButton(
              label: 'MANUALES',
              icon: Icons.edit_note_rounded,
              isSelected: !useCopaMundial,
              onTap: () => onToggleMode(false),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: _ModeButton(
              label: 'COPA DEL MUNDO',
              icon: Icons.emoji_events_rounded,
              isSelected: useCopaMundial,
              onTap: () => onToggleMode(true),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyPartidos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.sports_soccer_outlined,
            size: 64,
            color: AppColors.textMuted,
          ),
          const SizedBox(height: 16),
          Text(
            'No hay partidos configurados',
            style: AppTypography.bodyMedium
                .copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 8),
          Text(
            'Ingresa la cantidad y presiona CREAR',
            style: AppTypography.bodySmall,
          ),
        ],
      ),
    );
  }
}

// ── Resultados Tab ────────────────────────────────────────────────────────────

class _ResultadosTab extends ConsumerWidget {
  const _ResultadosTab({required this.state});
  final CombinacionesState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Error sin resultados
    if (state.error != null && !state.hasResults) {
      return Center(
        child: Text(state.error!,
            style: AppTypography.bodyMedium.copyWith(color: AppColors.redNeon)),
      );
    }

    // Vacío inicial (ni generando ni hay resultados)
    if (!state.isGenerating && !state.hasResults) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.table_chart_outlined,
                size: 64, color: AppColors.textMuted),
            const SizedBox(height: 16),
            Text(
              'Sin resultados aún',
              style: AppTypography.bodyMedium
                  .copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 8),
            Text(
              'Configura los partidos y presiona\nGENERAR COMBINACIONES',
              style: AppTypography.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    // Generando sin ningún resultado aún → spinner compacto
    if (state.isGenerating && !state.hasResults) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 36,
              height: 36,
              child: CircularProgressIndicator(
                color: AppColors.cyanNeon,
                strokeWidth: 3,
              ),
            ),
            SizedBox(height: 16),
            Text('Iniciando motor de combinaciones...'),
          ],
        ),
      );
    }

    // Hay resultados (parciales o completos) → mostrar tabla
    return Column(
      children: [
        // Banner de progreso animado (solo visible mientras sigue generando)
        if (state.isGenerating)
          _ProgressBanner(count: state.totalFiltrado),

        if (!state.isGenerating) ...([
          ExportActionBar(state: state),
          const SizedBox(height: 12),
        ]),

        Expanded(
          child: CombinacionesTable(
            combinaciones: state.combinaciones,
            hasMore: state.hasMore,
            onLoadMore: () {
              ref.read(combinacionesProvider.notifier).cargarMas();
            },
          ),
        ),
      ],
    );
  }
}

// ── Banner de progreso ─────────────────────────────────────────────────────────

class _ProgressBanner extends StatelessWidget {
  const _ProgressBanner({required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.cyanNeon.withAlpha(30),
            AppColors.primary.withAlpha(30),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.cyanNeon.withAlpha(80)),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              color: AppColors.cyanNeon,
              strokeWidth: 2,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Generando... ${_formatNum(count)} combinaciones encontradas',
              style: AppTypography.labelMedium
                  .copyWith(color: AppColors.cyanNeon),
            ),
          ),
        ],
      ),
    );
  }

  String _formatNum(int n) {
    // Formato con separador de miles
    final s = n.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) buffer.write('.');
      buffer.write(s[i]);
    }
    return buffer.toString();
  }
}

// ── World Cup Match Selection Components ─────────────────────────────────────

class _CopaPartidoCard extends ConsumerWidget {
  const _CopaPartidoCard({
    required this.match,
  });

  final FixtureModel match;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(seleccionPartidosProvider);
    final selectionNotifier = ref.read(seleccionPartidosProvider.notifier);
    final matchId = match.fixture.id;

    final homeAbbr = match.teams.home.code?.isNotEmpty == true 
        ? match.teams.home.code! 
        : (match.teams.home.name.length >= 3 
            ? match.teams.home.name.substring(0, 3).toUpperCase() 
            : match.teams.home.name.toUpperCase());

    final awayAbbr = match.teams.away.code?.isNotEmpty == true 
        ? match.teams.away.code! 
        : (match.teams.away.name.length >= 3 
            ? match.teams.away.name.substring(0, 3).toUpperCase() 
            : match.teams.away.name.toUpperCase());

    final isSelected = selectionNotifier.estaSeleccionado(matchId);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GlassCard(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        glowColor: isSelected ? AppColors.premiumBlue : null,
        child: Row(
          children: [
            // Local Flag and Name
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      homeAbbr,
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  TeamLogo(
                    logoUrl: match.teams.home.logo,
                    width: 26,
                    height: 26,
                    fallbackIcon: Icons.flag_rounded,
                    fallbackIconSize: 18,
                  ),
                ],
              ),
            ),
            
            // VS label
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.border, width: 0.5),
                ),
                child: const Text(
                  'VS',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),

            // Visitor Flag and Name
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TeamLogo(
                    logoUrl: match.teams.away.logo,
                    width: 26,
                    height: 26,
                    fallbackIcon: Icons.flag_rounded,
                    fallbackIconSize: 18,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      awayAbbr,
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // Sign selectors (L, E, V buttons as micro chips)
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _CopaOptionChip(
                    label: '1',
                    tooltip: 'Local (1)',
                    isSelected: selectionNotifier.tieneSigno(matchId, '1'),
                    color: AppColors.cyanNeon,
                    onTap: () => selectionNotifier.toggleSigno(match, '1'),
                  ),
                  _CopaOptionChip(
                    label: 'X',
                    tooltip: 'Empate (X)',
                    isSelected: selectionNotifier.tieneSigno(matchId, 'X'),
                    color: AppColors.goldNeon,
                    onTap: () => selectionNotifier.toggleSigno(match, 'X'),
                  ),
                  _CopaOptionChip(
                    label: '2',
                    tooltip: 'Visitante (2)',
                    isSelected: selectionNotifier.tieneSigno(matchId, '2'),
                    color: AppColors.greenNeon,
                    onTap: () => selectionNotifier.toggleSigno(match, '2'),
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

class _ModeButton extends StatelessWidget {
  const _ModeButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          gradient: isSelected ? AppColors.primaryGradient : null,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? AppColors.textOnAccent : AppColors.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTypography.labelLarge.copyWith(
                fontSize: 12,
                color: isSelected ? AppColors.textOnAccent : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CopaOptionChip extends StatelessWidget {
  const _CopaOptionChip({
    required this.label,
    required this.tooltip,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });

  final String label;
  final String tooltip;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.only(right: 4),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? color.withAlpha(51) : AppColors.glassWhite,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: isSelected ? color : AppColors.border,
              width: isSelected ? 1.5 : 0.5,
            ),
            boxShadow: isSelected
                ? [BoxShadow(color: color.withAlpha(51), blurRadius: 6)]
                : null,
          ),
          child: Text(
            label,
            style: AppTypography.labelSmall.copyWith(
              color: isSelected ? color : AppColors.textSecondary,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
