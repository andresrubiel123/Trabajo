/// Generador de reportes PDF para las combinaciones deportivas.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../features/combinaciones/domain/entities/combinacion_entity.dart';

/// Generador de reportes PDF para las combinaciones.
class PdfGenerator {
  const PdfGenerator();

  /// Genera un documento PDF y retorna los bytes.
  Future<List<int>> generarPdf(List<CombinacionEntity> combinaciones) async {
    final pdf = pw.Document();

    // Límite de seguridad para evitar desbordamiento de memoria al generar páginas
    final List<CombinacionEntity> listToExport = combinaciones.length > 2000
        ? combinaciones.sublist(0, 2000)
        : combinaciones;

    const rowsPerPage = 35;
    final totalPages = (listToExport.length / rowsPerPage).ceil();

    for (int pageIdx = 0; pageIdx < totalPages; pageIdx++) {
      final start = pageIdx * rowsPerPage;
      final end = (start + rowsPerPage < listToExport.length)
          ? start + rowsPerPage
          : listToExport.length;

      final subList = listToExport.sublist(start, end);

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(32),
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Encabezado en la primera página
                if (pageIdx == 0) ...[
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        'APUESTAS FUTBOL',
                        style: pw.TextStyle(
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.orange,
                        ),
                      ),
                      pw.Text(
                        DateTime.now().toString().substring(0, 16),
                        style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    'Reporte de Combinaciones Deportivas Generadas',
                    style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    'Total combinaciones: ${combinaciones.length}${combinaciones.length > 2000 ? " (Mostrando las primeras 2000 en PDF para optimizar espacio)" : ""}',
                    style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey700),
                  ),
                  pw.Divider(color: PdfColors.orange, thickness: 1.5),
                  pw.SizedBox(height: 12),
                ],
                // Tabla de datos
                pw.TableHelper.fromTextArray(
                  headers: ['#', 'Resultados Cortos', 'Detalle de Partidos'],
                  data: subList.map((c) {
                    final detalle = c.resultados
                        .asMap()
                        .entries
                        .map((e) => '${c.nombres[e.key]}: ${e.value}')
                        .join(' | ');
                    return [
                      c.indice.toString(),
                      c.toResultadosCortos(),
                      detalle,
                    ];
                  }).toList(),
                  headerStyle: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.white,
                  ),
                  headerDecoration: const pw.BoxDecoration(
                    color: PdfColors.orange,
                  ),
                  cellHeight: 18,
                  cellPadding: const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  cellStyle: const pw.TextStyle(fontSize: 8),
                  cellAlignment: pw.Alignment.centerLeft,
                ),
                pw.Spacer(),
                // Pie de página
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Reporte generado automáticamente',
                      style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey500),
                    ),
                    pw.Text(
                      'Página ${pageIdx + 1} de $totalPages',
                      style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );
    }

    return pdf.save();
  }
}
