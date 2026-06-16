/// Gestor de estado para la generación y exportación de combinaciones.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'dart:isolate';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/combinacion_entity.dart';
import '../../domain/entities/partido_entity.dart';
import '../../../../core/utils/combination_engine.dart';
import '../../../../core/utils/pdf_generator.dart';

// ── Estado ────────────────────────────────────────────────────────────────────

/// Estado de las combinaciones generadas.
class CombinacionesState {
  const CombinacionesState({
    this.combinaciones = const [],
    this.isGenerating = false,
    this.totalBruto = 0,
    this.error,
  });

  final List<CombinacionEntity> combinaciones;
  final bool isGenerating;
  final int totalBruto;
  final String? error;

  bool get hasResults => combinaciones.isNotEmpty;
  int get totalFiltrado => combinaciones.length;
  int get combinacionesEliminadas => totalBruto - totalFiltrado;

  /// Cuántas combinaciones se han recibido hasta ahora (alias legible).
  int get combinacionesMostradas => combinaciones.length;

  CombinacionesState copyWith({
    List<CombinacionEntity>? combinaciones,
    bool? isGenerating,
    int? totalBruto,
    String? error,
    bool clearError = false,
  }) {
    return CombinacionesState(
      combinaciones: combinaciones ?? this.combinaciones,
      isGenerating: isGenerating ?? this.isGenerating,
      totalBruto: totalBruto ?? this.totalBruto,
      error: clearError ? null : error ?? this.error,
    );
  }
}

// ── Notifier ──────────────────────────────────────────────────────────────────

/// Provider que maneja la generación progresiva de combinaciones.
class CombinacionesNotifier extends StateNotifier<CombinacionesState> {
  CombinacionesNotifier() : super(const CombinacionesState());

  Isolate? _isolate;
  ReceivePort? _receivePort;

  // ── Generación progresiva con Isolate ─────────────────────────────────────

  /// Genera combinaciones para la lista de partidos dada.
  ///
  /// Las combinaciones aparecen en la UI progresivamente a medida que el
  /// Isolate envía lotes de [AppConstants.streamingBatchSize] elementos.
  Future<void> generar(List<PartidoEntity> partidos) async {
    if (partidos.isEmpty) {
      state = state.copyWith(error: 'Agrega al menos un partido');
      return;
    }

    // Cancelar generación anterior si existe
    _cancelarIsolate();

    // Estado inicial: generando, lista vacía
    state = const CombinacionesState(isGenerating: true);

    _receivePort = ReceivePort();

    // Lanzar el isolate de trabajo
    _isolate = await CombinationEngine.lanzarIsolate(
      sendPort: _receivePort!.sendPort,
      partidos: partidos,
    );

    // Escuchar mensajes del isolate
    _receivePort!.listen(_onMensaje);
  }

  /// Procesa los mensajes enviados por el Isolate.
  void _onMensaje(dynamic mensaje) {
    if (!mounted) return;

    if (mensaje is LoteCombinaciones) {
      // Añadir el lote a la lista existente y notificar a la UI
      state = state.copyWith(
        combinaciones: [...state.combinaciones, ...mensaje.combinaciones],
      );
    } else if (mensaje is GeneracionFinalizada) {
      // Cálculo completado
      state = state.copyWith(
        isGenerating: false,
        totalBruto: mensaje.totalBruto,
        clearError: true,
      );
      _limpiarIsolate();
    } else if (mensaje is GeneracionError) {
      state = state.copyWith(
        isGenerating: false,
        error: 'Error al generar: ${mensaje.mensaje}',
      );
      _limpiarIsolate();
    }
  }

  // ── Gestión del Isolate ────────────────────────────────────────────────────

  void _cancelarIsolate() {
    _isolate?.kill(priority: Isolate.immediate);
    _receivePort?.close();
    _isolate = null;
    _receivePort = null;
  }

  void _limpiarIsolate() {
    _receivePort?.close();
    _isolate = null;
    _receivePort = null;
  }

  // ── Exportación ───────────────────────────────────────────────────────────

  /// Exporta las combinaciones actuales como texto plano.
  String exportarTexto() =>
      const CombinationEngine().exportarComoTexto(state.combinaciones);

  /// Genera y retorna el PDF de las combinaciones actuales.
  Future<List<int>> generarPdf() async {
    return const PdfGenerator().generarPdf(state.combinaciones);
  }

  // ── Reset ─────────────────────────────────────────────────────────────────

  /// Limpia los resultados y cancela cualquier generación en curso.
  void limpiar() {
    _cancelarIsolate();
    state = const CombinacionesState();
  }

  @override
  void dispose() {
    _cancelarIsolate();
    super.dispose();
  }
}

// ── Provider ──────────────────────────────────────────────────────────────────

final combinacionesProvider =
    StateNotifierProvider<CombinacionesNotifier, CombinacionesState>(
  (ref) => CombinacionesNotifier(),
);
