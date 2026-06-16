/// Barra de acciones de exportación (Copiar, TXT, PDF).
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/widgets/neon_button.dart';
import '../../../../core/utils/file_export_helper.dart';
import '../providers/combinaciones_provider.dart';

/// Barra de acciones de exportación para los resultados de combinaciones.
class ExportActionBar extends ConsumerWidget {
  const ExportActionBar({super.key, required this.state});
  final CombinacionesState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(combinacionesProvider.notifier);
    const helper = FileExportHelper();
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    Widget buildButtons() {
      return Row(
        children: [
          Expanded(
            child: NeonButton(
              label: 'COPIAR',
              icon: Icons.copy_rounded,
              onPressed: () {
                final texto = notifier.exportarTexto();
                Clipboard.setData(ClipboardData(text: texto));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Combinaciones copiadas al portapapeles'),
                  ),
                );
              },
              isOutlined: true,
              color: AppColors.primary,
              height: 40,
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: NeonButton(
              label: 'TXT',
              icon: Icons.text_snippet_outlined,
              onPressed: () async {
                try {
                  final texto = notifier.exportarTexto();
                  final path = await helper.exportarTxt(contenido: texto);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('TXT guardado en:\n$path'),
                        duration: const Duration(seconds: 4),
                      ),
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: $e')),
                    );
                  }
                }
              },
              isOutlined: true,
              color: AppColors.greenNeon,
              height: 40,
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: NeonButton(
              label: 'PDF',
              icon: Icons.picture_as_pdf_outlined,
              onPressed: () async {
                try {
                  final bytes = await notifier.generarPdf();
                  final path = await helper.exportarPdf(bytes: bytes);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('PDF guardado en:\n$path'),
                        duration: const Duration(seconds: 4),
                      ),
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: $e')),
                    );
                  }
                }
              },
              isOutlined: true,
              color: AppColors.amber,
              height: 40,
            ),
          ),
        ],
      );
    }

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildButtons(),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${state.totalFiltrado} combinaciones',
              style: AppTypography.labelMedium.copyWith(color: AppColors.primary, fontSize: 11),
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        SizedBox(
          width: 340,
          child: buildButtons(),
        ),
        const Spacer(),
        Text(
          '${state.totalFiltrado} combinaciones',
          style: AppTypography.labelMedium
              .copyWith(color: AppColors.primary),
        ),
      ],
    );
  }
}
