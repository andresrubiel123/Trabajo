/// Tabla interactiva para visualizar las combinaciones generadas.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../domain/entities/combinacion_entity.dart';

/// Tabla de combinaciones generadas con búsqueda y scroll.
class CombinacionesTable extends StatefulWidget {
  const CombinacionesTable({super.key, required this.combinaciones});
  final List<CombinacionEntity> combinaciones;

  @override
  State<CombinacionesTable> createState() => _CombinacionesTableState();
}

class _CombinacionesTableState extends State<CombinacionesTable> {
  final _searchCtrl = TextEditingController();
  List<CombinacionEntity> _filtered = [];

  @override
  void initState() {
    super.initState();
    _filtered = widget.combinaciones;
    _searchCtrl.addListener(_onSearch);
  }

  @override
  void didUpdateWidget(CombinacionesTable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.combinaciones != widget.combinaciones) {
      // Si hay búsqueda activa, re-filtrar; si no, tomar la lista completa actualizada
      final q = _searchCtrl.text.toLowerCase();
      if (q.isEmpty) {
        _filtered = widget.combinaciones;
      } else {
        _filtered = widget.combinaciones
            .where((c) => c.toTextoLinea().toLowerCase().contains(q))
            .toList();
      }
    }
  }

  void _onSearch() {
    final q = _searchCtrl.text.toLowerCase();
    setState(() {
      _filtered = q.isEmpty
          ? widget.combinaciones
          : widget.combinaciones
              .where((c) => c.toTextoLinea().toLowerCase().contains(q))
              .toList();
    });
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Barra de búsqueda ──────────────────────────────────────────
        TextField(
          controller: _searchCtrl,
          style: AppTypography.bodyMedium.copyWith(fontSize: 14),
          decoration: InputDecoration(
            hintText:
                'Buscar en ${widget.combinaciones.length} combinaciones...',
            prefixIcon: const Icon(Icons.search_rounded,
                color: AppColors.cyanNeon, size: 20),
            suffixIcon: _searchCtrl.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear_rounded,
                        color: AppColors.textSecondary, size: 18),
                    onPressed: () => _searchCtrl.clear(),
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        ),
        const SizedBox(height: 8),

        // ── Tabla ──────────────────────────────────────────────────────
        Expanded(
          child: GlassCard(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                // Header
                _buildHeader(),
                const Divider(height: 1, color: AppColors.border),
                // Rows
                Expanded(
                  child: ListView.builder(
                    itemCount: _filtered.length,
                    itemBuilder: (context, index) {
                      return _CombinacionRow(
                        combinacion: _filtered[index],
                        isEven: index.isEven,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Text('#',
                style: AppTypography.labelLarge.copyWith(
                    color: AppColors.textOnAccent, fontSize: 13)),
          ),
          Expanded(
            child: Text(
              _filtered.isEmpty
                  ? 'Sin resultados'
                  : 'Combinaciones (${_filtered.length})',
              style: AppTypography.labelLarge.copyWith(
                  color: AppColors.textOnAccent, fontSize: 13),
            ),
          ),
          Text(
            'L/E/V',
            style: AppTypography.labelLarge.copyWith(
                color: AppColors.textOnAccent, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _CombinacionRow extends StatefulWidget {
  const _CombinacionRow({
    required this.combinacion,
    required this.isEven,
  });

  final CombinacionEntity combinacion;
  final bool isEven;

  @override
  State<_CombinacionRow> createState() => _CombinacionRowState();
}

class _CombinacionRowState extends State<_CombinacionRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: _isHovered
            ? AppColors.cyanNeon.withAlpha(13)
            : widget.isEven
                ? AppColors.glassWhite
                : Colors.transparent,
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: Text(
                '${widget.combinacion.indice}',
                style: AppTypography.mono
                    .copyWith(color: AppColors.textSecondary, fontSize: 12),
              ),
            ),
            Expanded(
              child: Text(
                widget.combinacion.resultados
                    .asMap()
                    .entries
                    .map((e) =>
                        '${widget.combinacion.nombres[e.key]}: ${e.value}')
                    .join(' │ '),
                style: AppTypography.bodySmall.copyWith(
                  fontSize: 13,
                  color: _isHovered
                      ? AppColors.textPrimary
                      : AppColors.textPrimary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              widget.combinacion.toResultadosCortos(),
              style: AppTypography.monoAccent.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
