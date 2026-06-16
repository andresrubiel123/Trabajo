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
    final partidos = ref.read(partidosProvider);
    if (partidos.isEmpty) {
      _showSnack('Primero crea los partidos');
      return;
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

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ───────────────────────────────────────────────────
          _PageHeader(partidosCount: partidos.length),
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
  });

  final TextEditingController cantidadCtrl;
  final List partidos;
  final VoidCallback onCrear;
  final VoidCallback onGenerar;
  final bool isGenerating;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        // ── Input cantidad ───────────────────────────────────────────
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

        // ── Lista de partidos ─────────────────────────────────────────
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

        // ── Botón Generar ─────────────────────────────────────────────
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

class _ResultadosTab extends StatelessWidget {
  const _ResultadosTab({required this.state});
  final CombinacionesState state;

  @override
  Widget build(BuildContext context) {
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
          _ProgressBanner(count: state.combinacionesMostradas),

        if (!state.isGenerating) ...([
          ExportActionBar(state: state),
          const SizedBox(height: 12),
        ]),

        Expanded(
          child: CombinacionesTable(combinaciones: state.combinaciones),
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
