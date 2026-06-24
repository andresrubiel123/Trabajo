/// Pantalla principal Copa del Mundo FIFA 2026 con partidos organizados por fases.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-24
///
/// Funcionalidad:
/// - Tabs por fase: Grupos | Octavos | Cuartos | Semis | Final
/// - Cada partido muestra banderas, equipos, fecha y marcador
/// - Funciona 100% offline (datos en Isar local)
/// - Botón de sincronización manual con APIs externas
library;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/local/providers/local_data_providers.dart';
import '../../../../core/local/schemas/partido_local_schema.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/gradient_text.dart';

/// Pantalla Copa del Mundo 2026 con tabs por fase del torneo.
class MundialPartidosPage extends ConsumerStatefulWidget {
  const MundialPartidosPage({super.key});

  @override
  ConsumerState<MundialPartidosPage> createState() =>
      _MundialPartidosPageState();
}

class _MundialPartidosPageState extends ConsumerState<MundialPartidosPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool _sincronizando = false;

  static const List<String> _grupos = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _sincronizarManual() async {
    if (_sincronizando) return;
    setState(() => _sincronizando = true);
    try {
      final syncService = ref.read(mundialSyncServiceProvider);
      await syncService.syncForced();
      if (mounted) {
        // Invalidar providers para forzar recarga
        ref.invalidate(partidosMundialProvider);
        ref.invalidate(equiposMundialProvider);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Datos actualizados desde las APIs'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _sincronizando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final countAsync = ref.watch(countPartidosMundialProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF006400), Color(0xFF008000)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.emoji_events_rounded,
                  color: Colors.white, size: 18),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GradientText(
                  'COPA DEL MUNDO 2026',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                countAsync.when(
                  data: (count) => Text(
                    'USA · Canadá · México • $count partidos',
                    style: AppTypography.bodySmall.copyWith(fontSize: 10),
                  ),
                  loading: () => const SizedBox.shrink(),
                  error: (_, _) => const SizedBox.shrink(),
                ),
              ],
            ),
          ],
        ),
        actions: [
          if (_sincronizando)
            const Padding(
              padding: EdgeInsets.all(12),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.primary,
                ),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.sync_rounded, color: AppColors.primary),
              tooltip: 'Sincronizar con APIs',
              onPressed: _sincronizarManual,
            ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: AppColors.primary,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondary,
          labelStyle: AppTypography.labelSmall
              .copyWith(fontWeight: FontWeight.bold, fontSize: 11),
          tabAlignment: TabAlignment.start,
          tabs: const [
            Tab(text: 'GRUPOS'),
            Tab(text: 'OCTAVOS'),
            Tab(text: 'CUARTOS'),
            Tab(text: 'SEMIS'),
            Tab(text: '3° LUGAR'),
            Tab(text: 'FINAL'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _GruposTab(grupos: _grupos),
          _PartidosRondaTab(ronda: 'Octavos de Final'),
          _PartidosRondaTab(ronda: 'Cuartos de Final'),
          _PartidosRondaTab(ronda: 'Semifinal'),
          _PartidosRondaTab(ronda: 'Tercer Lugar'),
          _FinalTab(),
        ],
      ),
    );
  }
}

// ── Tab de Fase de Grupos ─────────────────────────────────────────────────────

class _GruposTab extends ConsumerWidget {
  const _GruposTab({required this.grupos});

  final List<String> grupos;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      itemCount: grupos.length,
      itemBuilder: (context, i) => _GrupoSection(grupo: grupos[i]),
    );
  }
}

class _GrupoSection extends ConsumerWidget {
  const _GrupoSection({required this.grupo});

  final String grupo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final partidosAsync = ref.watch(partidosMundialPorGrupoProvider(grupo));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: AppColors.orangeGlow,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  grupo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'GRUPO $grupo',
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
        partidosAsync.when(
          data: (partidos) => Column(
            children: partidos.map((p) => _PartidoCard(partido: p)).toList(),
          ),
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          ),
          error: (e, _) => Text('Error: $e',
              style: TextStyle(color: AppColors.error)),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

// ── Tab de ronda eliminatoria ─────────────────────────────────────────────────

class _PartidosRondaTab extends ConsumerWidget {
  const _PartidosRondaTab({required this.ronda});

  final String ronda;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final partidosAsync = ref.watch(partidosMundialPorRondaProvider(ronda));

    return partidosAsync.when(
      data: (partidos) {
        if (partidos.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.sports_soccer_rounded,
                    size: 64, color: AppColors.textSecondary.withAlpha(77)),
                const SizedBox(height: 16),
                Text(
                  'Los partidos de $ronda\naún no están definidos',
                  textAlign: TextAlign.center,
                  style: AppTypography.bodyMedium
                      .copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: partidos.length,
          itemBuilder: (_, i) => _PartidoCard(partido: partidos[i]),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
      error: (e, _) => Center(
        child: Text('Error: $e', style: TextStyle(color: AppColors.error)),
      ),
    );
  }
}

// ── Tab Final ─────────────────────────────────────────────────────────────────

class _FinalTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final partidosAsync = ref.watch(partidosMundialPorRondaProvider('Final'));

    return partidosAsync.when(
      data: (partidos) {
        if (partidos.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.emoji_events_rounded,
                    size: 80, color: AppColors.goldNeon),
                const SizedBox(height: 16),
                const GradientText('GRAN FINAL',
                    style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(
                  'La Final aún no está definida',
                  style: AppTypography.bodyMedium
                      .copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
          );
        }
        final final_ = partidos.first;
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Icon(Icons.emoji_events_rounded,
                  size: 64, color: AppColors.goldNeon),
              const SizedBox(height: 8),
              const GradientText(
                '🏆 GRAN FINAL - COPA DEL MUNDO 2026',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
              ),
              const SizedBox(height: 8),
              Text(
                final_.estadio ?? 'MetLife Stadium',
                style: AppTypography.bodySmall
                    .copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 32),
              _PartidoCard(partido: final_, destacado: true),
            ],
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.goldNeon),
      ),
      error: (e, _) => Center(
        child: Text('Error: $e', style: TextStyle(color: AppColors.error)),
      ),
    );
  }
}

// ── Tarjeta de partido ────────────────────────────────────────────────────────

class _PartidoCard extends StatelessWidget {
  const _PartidoCard({required this.partido, this.destacado = false});

  final PartidoLocalSchema partido;
  final bool destacado;

  @override
  Widget build(BuildContext context) {
    final fecha = DateFormat('dd MMM • HH:mm', 'es').format(
      partido.fecha.toLocal(),
    );
    final esJugado = partido.estado == EstadoPartido.finalizado;
    final enJuego = partido.estado == EstadoPartido.enJuego;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GlassCard(
        glowColor: destacado
            ? AppColors.goldNeon
            : enJuego
                ? AppColors.greenNeon
                : AppColors.border,
        padding: EdgeInsets.all(destacado ? 20 : 14),
        child: Column(
          children: [
            // ── Fila de fecha y estado ──────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  fecha,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                  ),
                ),
                _EstadoBadge(estado: partido.estado),
              ],
            ),
            SizedBox(height: destacado ? 20 : 12),

            // ── Fila de equipos y marcador ──────────────────────────────
            Row(
              children: [
                // Equipo local
                Expanded(
                  child: _EquipoWidget(
                    nombre: partido.equipoLocalNombre,
                    escudoUrl: partido.equipoLocalEscudoUrl,
                    banderaUrl: partido.banderaLocalUrl,
                    alineacionDerecha: false,
                    grande: destacado,
                  ),
                ),

                // Marcador central
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: esJugado || enJuego
                      ? _Marcador(
                          golesLocal: partido.golesLocal,
                          golesVisitante: partido.golesVisitante,
                          enJuego: enJuego,
                          grande: destacado,
                        )
                      : Text(
                          'VS',
                          style: AppTypography.headlineMedium.copyWith(
                            color: AppColors.textSecondary,
                            fontSize: destacado ? 22 : 16,
                          ),
                        ),
                ),

                // Equipo visitante
                Expanded(
                  child: _EquipoWidget(
                    nombre: partido.equipoVisitanteNombre,
                    escudoUrl: partido.equipoVisitanteEscudoUrl,
                    banderaUrl: partido.banderaVisitanteUrl,
                    alineacionDerecha: true,
                    grande: destacado,
                  ),
                ),
              ],
            ),

            // ── Ciudad/estadio ──────────────────────────────────────────
            if (partido.ciudad != null || partido.estadio != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  [
                    if (partido.estadio != null) partido.estadio!,
                    if (partido.ciudad != null) partido.ciudad!,
                  ].join(' • '),
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textMuted,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _EquipoWidget extends StatelessWidget {
  const _EquipoWidget({
    required this.nombre,
    this.escudoUrl,
    this.banderaUrl,
    required this.alineacionDerecha,
    this.grande = false,
  });

  final String nombre;
  final String? escudoUrl;
  final String? banderaUrl;
  final bool alineacionDerecha;
  final bool grande;

  @override
  Widget build(BuildContext context) {
    final logoSize = grande ? 52.0 : 40.0;
    final nombreSize = grande ? 13.0 : 11.0;

    // Usamos la bandera si está disponible, si no el escudo
    final imageUrl = banderaUrl ?? escudoUrl;

    final children = [
      // Logo/bandera
      ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: imageUrl != null
            ? CachedNetworkImage(
                imageUrl: imageUrl,
                width: logoSize,
                height: logoSize,
                fit: BoxFit.cover,
                placeholder: (_, _) => Container(
                  width: logoSize,
                  height: logoSize,
                  color: AppColors.surfaceElevated,
                  alignment: Alignment.center,
                  child: Text(
                    nombre.isNotEmpty ? nombre[0] : '?',
                    style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                errorWidget: (_, _, _) => Container(
                  width: logoSize,
                  height: logoSize,
                  color: AppColors.surfaceElevated,
                  alignment: Alignment.center,
                  child: Text(
                    nombre.isNotEmpty ? nombre[0] : '?',
                    style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              )
            : Container(
                width: logoSize,
                height: logoSize,
                decoration: BoxDecoration(
                  color: AppColors.surfaceElevated,
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Text(
                  nombre.isNotEmpty ? nombre[0] : '?',
                  style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
      ),
      const SizedBox(height: 6),
      // Nombre del equipo
      Text(
        nombre,
        style: AppTypography.bodySmall.copyWith(
          fontSize: nombreSize,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        textAlign: alineacionDerecha ? TextAlign.right : TextAlign.left,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ];

    return Column(
      crossAxisAlignment: alineacionDerecha
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: children,
    );
  }
}

class _Marcador extends StatelessWidget {
  const _Marcador({
    this.golesLocal,
    this.golesVisitante,
    required this.enJuego,
    this.grande = false,
  });

  final int? golesLocal;
  final int? golesVisitante;
  final bool enJuego;
  final bool grande;

  @override
  Widget build(BuildContext context) {
    final size = grande ? 28.0 : 22.0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: enJuego
            ? AppColors.greenNeon.withAlpha(26)
            : AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: enJuego
              ? AppColors.greenNeon.withAlpha(77)
              : AppColors.border,
        ),
      ),
      child: Text(
        '${golesLocal ?? 0} - ${golesVisitante ?? 0}',
        style: AppTypography.headlineMedium.copyWith(
          fontSize: size,
          color: enJuego ? AppColors.greenNeon : AppColors.textPrimary,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
    );
  }
}

class _EstadoBadge extends StatelessWidget {
  const _EstadoBadge({required this.estado});

  final EstadoPartido estado;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (estado) {
      EstadoPartido.finalizado => ('FIN', AppColors.textSecondary),
      EstadoPartido.enJuego => ('● LIVE', AppColors.greenNeon),
      EstadoPartido.pospuesto => ('POSPUESTO', AppColors.warning),
      EstadoPartido.cancelado => ('CANCELADO', AppColors.error),
      EstadoPartido.programado => ('PRG', AppColors.premiumBlue),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withAlpha(26),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withAlpha(77)),
      ),
      child: Text(
        label,
        style: AppTypography.labelSmall.copyWith(
          color: color,
          fontSize: 9,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
