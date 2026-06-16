/// Helper para exportar combinaciones a archivos locales en formato TXT y PDF.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// Helper para exportar combinaciones a archivos locales.
class FileExportHelper {
  const FileExportHelper();

  /// Guarda texto en un archivo .txt y retorna la ruta.
  Future<String> exportarTxt({
    required String contenido,
    String nombreArchivo = 'combinaciones',
  }) async {
    final dir = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final file = File('${dir.path}/${nombreArchivo}_$timestamp.txt');
    await file.writeAsString(contenido, encoding: SystemEncoding());
    return file.path;
  }

  /// Guarda PDF y retorna la ruta.
  Future<String> exportarPdf({
    required List<int> bytes,
    String nombreArchivo = 'combinaciones',
  }) async {
    final dir = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final file = File('${dir.path}/${nombreArchivo}_$timestamp.pdf');
    await file.writeAsBytes(bytes);
    return file.path;
  }
}
