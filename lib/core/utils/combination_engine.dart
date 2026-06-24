/// Motor de generación y filtrado de combinaciones deportivas.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'dart:isolate';
import 'dart:typed_data';

import '../../features/combinaciones/domain/entities/combinacion_entity.dart';
import '../../features/combinaciones/domain/entities/partido_entity.dart';
import '../constants/app_constants.dart';

// ── Mensajes del protocolo Isolate ──────────────────────────────────────────

/// Mensaje inicial enviado al Isolate para arrancar la generación.
class _IsolateConfig {
  const _IsolateConfig({
    required this.sendPort,
    required this.partidos,
    required this.batchSize,
    required this.maxConsecutivos,
  });
  final SendPort sendPort;
  final List<PartidoEntity> partidos;
  final int batchSize;
  final int maxConsecutivos;
}

/// Lote de combinaciones generadas (streaming).
class LoteCombinaciones {
  const LoteCombinaciones(this.combinaciones);
  final List<CombinacionEntity> combinaciones;
}

/// Señal de finalización con estadísticas.
class GeneracionFinalizada {
  const GeneracionFinalizada({required this.totalBruto});
  final int totalBruto;
}

/// Señal de error durante la generación.
class GeneracionError {
  const GeneracionError(this.mensaje);
  final String mensaje;
}

// ── Motor Principal ──────────────────────────────────────────────────────────

/// Motor de generación de combinaciones con soporte de streaming por lotes.
///
/// Algoritmo:
/// 1. Calcula las opciones por partido (L/E/V o fijo).
/// 2. Itera combinaciones mediante índice numérico (sin product cartesiano en RAM).
/// 3. Filtra consecutivos aplicando el límite solo a partidos variables.
/// 4. Emite lotes de [AppConstants.streamingBatchSize] hacia el hilo principal.
class CombinationEngine {
  const CombinationEngine();

  // ── API de Isolate (streaming) ─────────────────────────────────────────────

  /// Lanza un Isolate que genera combinaciones y envía lotes al [sendPort].
  ///
  /// Mensajes emitidos:
  /// - [LoteCombinaciones]: lote parcial de combinaciones.
  /// - [GeneracionFinalizada]: fin del proceso con total bruto.
  /// - [GeneracionError]: error inesperado.
  static Future<Isolate> lanzarIsolate({
    required SendPort sendPort,
    required List<PartidoEntity> partidos,
    int batchSize = AppConstants.streamingBatchSize,
    int maxConsecutivos = AppConstants.maxConsecutivosIguales,
  }) {
    final config = _IsolateConfig(
      sendPort: sendPort,
      partidos: partidos,
      batchSize: batchSize,
      maxConsecutivos: maxConsecutivos,
    );
    return Isolate.spawn(_isolateEntryPoint, config);
  }

  // ── Punto de entrada del Isolate ──────────────────────────────────────────

  static void _isolateEntryPoint(_IsolateConfig config) {
    try {
      final engine = const CombinationEngine();
      engine._generarYEmitir(
        sendPort: config.sendPort,
        partidos: config.partidos,
        batchSize: config.batchSize,
        maxConsecutivos: config.maxConsecutivos,
      );
    } catch (e, st) {
      config.sendPort.send(GeneracionError('$e\n$st'));
    }
  }

  // ── Lógica central (corre dentro del Isolate) ─────────────────────────────

  void _generarYEmitir({
    required SendPort sendPort,
    required List<PartidoEntity> partidos,
    required int batchSize,
    required int maxConsecutivos,
  }) {
    if (partidos.isEmpty) {
      sendPort.send(const GeneracionFinalizada(totalBruto: 0));
      return;
    }

    // Opciones por partido: si está fijo → solo esa opción; si tiene selección → solo esas opciones; si no → L/E/V
    final opciones = partidos.map((p) {
      if (p.tieneFijo) return [p.resultadoFijo!];
      if (p.resultadosSeleccionados.isNotEmpty) {
        return p.resultadosSeleccionados.map((s) {
          if (s == '1') return 'Local';
          if (s == 'X') return 'Empate';
          if (s == '2') return 'Visitante';
          return s;
        }).toList();
      }
      return AppConstants.resultadosDisponibles;
    }).toList();

    // Índices de partidos variables (para filtro de consecutivos)
    final indicesVariables = [
      for (int i = 0; i < partidos.length; i++)
        if (!partidos[i].tieneFijo) i,
    ];

    // Total bruto = producto de cantidades de opciones
    final totalBruto = opciones.fold<int>(1, (acc, o) => acc * o.length);

    // Buffer de emisión
    final lote = <CombinacionEntity>[];
    int indiceFiltrado = 1; // Índice de las combinaciones que pasan el filtro

    // Iteración por índice numérico — evita construir listas en RAM
    for (int idx = 0; idx < totalBruto; idx++) {
      final resultados = _decodificarIndice(idx, opciones);

      // Filtro de consecutivos (solo sobre partidos variables)
      final variables = [for (final i in indicesVariables) resultados[i]];
      if (_tieneMasDeNConsecutivos(variables, maxConsecutivos)) continue;

      final resultadosCodificados = Uint8List.fromList(
        resultados.map((res) {
          if (res == 'Local') return 1;
          if (res == 'Empate') return 0;
          return 2; // 'Visitante'
        }).toList(),
      );

      lote.add(CombinacionEntity(
        indice: indiceFiltrado++,
        resultadosCodificados: resultadosCodificados,
        nombres: [for (final p in partidos) p.nombre],
      ));

      // Emitir lote cuando alcanza el tamaño objetivo
      if (lote.length >= batchSize) {
        sendPort.send(LoteCombinaciones(List.unmodifiable(lote)));
        lote.clear();
      }
    }

    // Emitir el lote restante (puede ser < batchSize)
    if (lote.isNotEmpty) {
      sendPort.send(LoteCombinaciones(List.unmodifiable(lote)));
    }

    sendPort.send(GeneracionFinalizada(totalBruto: totalBruto));
  }

  // ── Decodificación por índice (O(1) por combinación) ─────────────────────

  /// Convierte un índice numérico en la combinación correspondiente.
  ///
  /// Ejemplo: partidos=[L/E/V, L/E/V], idx=4 → [V, E] (base 3 mixta).
  List<String> _decodificarIndice(int idx, List<List<String>> opciones) {
    final resultado = List<String>.filled(opciones.length, '');
    int remaining = idx;
    for (int i = opciones.length - 1; i >= 0; i--) {
      final n = opciones[i].length;
      resultado[i] = opciones[i][remaining % n];
      remaining ~/= n;
    }
    return resultado;
  }

  // ── Filtro de Consecutivos ────────────────────────────────────────────────

  /// Retorna `true` si hay [n] o más resultados consecutivos iguales.
  bool _tieneMasDeNConsecutivos(List<String> resultados, int n) {
    if (resultados.length < n) return false;
    for (int i = 0; i <= resultados.length - n; i++) {
      final ref = resultados[i];
      bool todosIguales = true;
      for (int j = i + 1; j < i + n; j++) {
        if (resultados[j] != ref) {
          todosIguales = false;
          break;
        }
      }
      if (todosIguales) return true;
    }
    return false;
  }

  // ── API Legacy (sin isolate, para cálculos rápidos) ──────────────────────

  /// Calcula cuántas combinaciones brutas habría sin filtro.
  int calcularTotal(List<PartidoEntity> partidos) {
    if (partidos.isEmpty) return 0;
    return partidos.fold(1, (acc, p) {
      if (p.tieneFijo) return acc * 1;
      if (p.resultadosSeleccionados.isNotEmpty) return acc * p.resultadosSeleccionados.length;
      return acc * AppConstants.resultadosDisponibles.length;
    });
  }

  /// Exporta combinaciones como texto plano (para TXT/PDF).
  String exportarComoTexto(List<CombinacionEntity> combinaciones) {
    final buffer = StringBuffer();
    buffer.writeln('GOL SAINT — Combinaciones Generadas');
    buffer.writeln('Total: ${combinaciones.length} combinaciones');
    buffer.writeln('=' * 60);
    buffer.writeln();
    for (final c in combinaciones) {
      buffer.writeln(c.toTextoLinea());
    }
    return buffer.toString();
  }

  /// Exporta TODAS las combinaciones directamente a un gran String corriendo en un Isolate separado.
  /// Esto evita congelar el hilo principal y usar demasiada RAM reteniendo las entidades.
  static Future<String> exportarTextoIsolate(List<PartidoEntity> partidos, {int maxConsecutivos = AppConstants.maxConsecutivosIguales}) {
    return Isolate.run(() {
      final engine = const CombinationEngine();
      return engine._generarStringCompleto(partidos, maxConsecutivos);
    });
  }

  String _generarStringCompleto(List<PartidoEntity> partidos, int maxConsecutivos) {
    if (partidos.isEmpty) return 'Sin partidos.';

    final opciones = partidos.map((p) {
      if (p.tieneFijo) return [p.resultadoFijo!];
      if (p.resultadosSeleccionados.isNotEmpty) {
        return p.resultadosSeleccionados.map((s) {
          if (s == '1') return 'Local';
          if (s == 'X') return 'Empate';
          if (s == '2') return 'Visitante';
          return s;
        }).toList();
      }
      return AppConstants.resultadosDisponibles;
    }).toList();
    final indicesVariables = [for (int i = 0; i < partidos.length; i++) if (!partidos[i].tieneFijo) i];
    final totalBruto = opciones.fold<int>(1, (acc, o) => acc * o.length);

    final buffer = StringBuffer();
    int indiceFiltrado = 1;
    final nombres = partidos.map((p) => p.nombre).toList();

    for (int idx = 0; idx < totalBruto; idx++) {
      final resultados = _decodificarIndice(idx, opciones);
      
      final variables = [for (final i in indicesVariables) resultados[i]];
      if (_tieneMasDeNConsecutivos(variables, maxConsecutivos)) continue;

      final partes = List.generate(resultados.length, (i) => '${nombres[i]}: ${resultados[i]}');
      buffer.writeln('${indiceFiltrado++}. ${partes.join(' | ')}');
    }

    final totalFiltrado = indiceFiltrado - 1;
    final header = StringBuffer();
    header.writeln('GOL SAINT — Combinaciones Generadas');
    header.writeln('Total: $totalFiltrado combinaciones');
    header.writeln('=' * 60);
    header.writeln();
    
    return header.toString() + buffer.toString();
  }
}
