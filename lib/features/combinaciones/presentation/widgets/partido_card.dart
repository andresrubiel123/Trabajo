/// Widget para configurar un partido y sus opciones de pronóstico.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../domain/entities/partido_entity.dart';
import '../providers/partidos_provider.dart';

/// Card editable de un partido individual.
class PartidoCard extends ConsumerStatefulWidget {
  const PartidoCard({
    super.key,
    required this.partido,
    required this.indice,
  });

  final PartidoEntity partido;
  final int indice;

  @override
  ConsumerState<PartidoCard> createState() => _PartidoCardState();
}

class _PartidoCardState extends ConsumerState<PartidoCard> {
  late TextEditingController _nameCtrl;
  String? _selectedResult;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.partido.nombre);
    _selectedResult = widget.partido.resultadoFijo;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(partidosProvider.notifier);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GlassCard(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            // Número de partido
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '${widget.indice}',
                  style: AppTypography.labelLarge.copyWith(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Nombre del partido
            Expanded(
              flex: 3,
              child: TextField(
                controller: _nameCtrl,
                style: AppTypography.bodyMedium.copyWith(fontSize: 14),
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  labelStyle:
                      AppTypography.labelSmall.copyWith(fontSize: 11),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 8),
                  isDense: true,
                ),
                onChanged: (v) =>
                    notifier.actualizarNombre(widget.partido.id, v),
              ),
            ),
            const SizedBox(width: 10),

            // Selector L/E/V/Libre
            Expanded(
              flex: 2,
              child: _ResultadoSelector(
                selected: _selectedResult,
                onChanged: (v) {
                  setState(() => _selectedResult = v);
                  notifier.fijarResultado(widget.partido.id, v);
                },
              ),
            ),
            const SizedBox(width: 8),

            // Botón eliminar
            IconButton(
              icon: const Icon(Icons.close_rounded,
                  color: AppColors.redNeon, size: 18),
              onPressed: () =>
                  notifier.eliminarPartido(widget.partido.id),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Selector de Resultado ─────────────────────────────────────────────────────

class _ResultadoSelector extends StatelessWidget {
  const _ResultadoSelector({
    required this.selected,
    required this.onChanged,
  });

  final String? selected;
  final ValueChanged<String?> onChanged;

  static const _options = [
    _ResultOption('L', 'Local', AppColors.cyanNeon),
    _ResultOption('E', 'Empate', AppColors.goldNeon),
    _ResultOption('V', 'Visitante', AppColors.greenNeon),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Libre button
          _OptionChip(
            label: '∞',
            tooltip: 'Libre (L/E/V)',
            isSelected: selected == null,
            color: AppColors.textSecondary,
            onTap: () => onChanged(null),
          ),
          ..._options.map(
            (opt) => _OptionChip(
              label: opt.short,
              tooltip: opt.label,
              isSelected: selected == opt.label,
              color: opt.color,
              onTap: () => onChanged(
                  selected == opt.label ? null : opt.label),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResultOption {
  const _ResultOption(this.short, this.label, this.color);
  final String short;
  final String label;
  final Color color;
}

class _OptionChip extends StatelessWidget {
  const _OptionChip({
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
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
              fontWeight:
                  isSelected ? FontWeight.w700 : FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
