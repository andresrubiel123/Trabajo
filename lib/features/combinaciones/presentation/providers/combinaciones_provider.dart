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
    this.partidosConfigurados = const [],
    this.isGenerating = false,
    this.totalBruto = 0,
    this.totalFiltrado = 0,
    this.error,
    this.hasMore = false,
  });

  final List<CombinacionEntity> combinaciones;
  final List<PartidoEntity> partidosConfigurados;
  final bool isGenerating;
  final int totalBruto;
  final int totalFiltrado;
  final String? error;
  final bool hasMore;

  bool get hasResults => totalFiltrado > 0;
  int get combinacionesEliminadas => totalBruto - totalFiltrado;

  /// Cuántas combinaciones se han recibido hasta ahora (alias legible).
  int get combinacionesMostradas => combinaciones.length;

  CombinacionesState copyWith({
    List<CombinacionEntity>? combinaciones,
    List<PartidoEntity>? partidosConfigurados,
    bool? isGenerating,
    int? totalBruto,
    int? totalFiltrado,
    String? error,
    bool? hasMore,
    bool clearError = false,
  }) {
    return CombinacionesState(
      combinaciones: combinaciones ?? this.combinaciones,
      partidosConfigurados: partidosConfigurados ?? this.partidosConfigurados,
      isGenerating: isGenerating ?? this.isGenerating,
      totalBruto: totalBruto ?? this.totalBruto,
      totalFiltrado: totalFiltrado ?? this.totalFiltrado,
      error: clearError ? null : error ?? this.error,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

/// Provider que maneja la generación progresiva y paginación de combinaciones.
class CombinacionesNotifier extends Notifier<CombinacionesState> {
  @override
  CombinacionesState build() {
    ref.onDispose(() {
      _cancelarIsolate();
    });
    return const CombinacionesState();
  }

  Isolate? _isolate;
  ReceivePort? _receivePort;

  // ── Paginación Virtual ───────────────────────────────────────────────────
  final List<CombinacionEntity> _todas = [];
  int _paginaActual = 1;
  static const int _itemsPorPagina = 100;

  // ── Generación progresiva con Isolate ─────────────────────────────────────

  /// Genera combinaciones para la lista de partidos dada.
  ///
  /// Las combinaciones se almacenan internamente y se van mostrando de forma
  /// paginada de 100 en 100 para optimizar el renderizado en la UI.
  Future<void> generar(List<PartidoEntity> partidos) async {
    if (partidos.isEmpty) {
      state = state.copyWith(error: 'Agrega al menos un partido');
      return;
    }

    // Cancelar generación anterior si existe
    _cancelarIsolate();
    _todas.clear();
    _paginaActual = 1;

    // Estado inicial: generando, lista vacía
    state = CombinacionesState(
      isGenerating: true,
      partidosConfigurados: partidos,
    );

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
    if (mensaje is LoteCombinaciones) {
      final nuevas = mensaje.combinaciones;
      _todas.addAll(nuevas);
      
      final visibleCount = _paginaActual * _itemsPorPagina;
      final listaNueva = _todas.take(visibleCount).toList();
      final hasMore = _todas.length > listaNueva.length || state.isGenerating;

      state = state.copyWith(
        combinaciones: listaNueva,
        totalFiltrado: state.totalFiltrado + nuevas.length,
        hasMore: hasMore,
      );
    } else if (mensaje is GeneracionFinalizada) {
      // Cálculo completado
      final visibleCount = _paginaActual * _itemsPorPagina;
      final listaNueva = _todas.take(visibleCount).toList();
      final hasMore = _todas.length > listaNueva.length;

      state = state.copyWith(
        isGenerating: false,
        totalBruto: mensaje.totalBruto,
        combinaciones: listaNueva,
        hasMore: hasMore,
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

  /// Carga el siguiente lote de 100 combinaciones si están disponibles.
  void cargarMas() {
    if (!state.hasMore) return;
    _paginaActual++;
    
    final visibleCount = _paginaActual * _itemsPorPagina;
    final listaNueva = _todas.take(visibleCount).toList();
    final hasMore = _todas.length > listaNueva.length || state.isGenerating;

    state = state.copyWith(
      combinaciones: listaNueva,
      hasMore: hasMore,
    );
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

  /// Exporta TODAS las combinaciones actuales como texto plano ejecutando un Isolate auxiliar.
  Future<String> exportarTexto() async {
    return CombinationEngine.exportarTextoIsolate(state.partidosConfigurados);
  }

  /// Genera y retorna el PDF de las combinaciones actuales (Límite: primeras 2000).
  Future<List<int>> generarPdf() async {
    // Para el PDF exportamos las que ya están visibles o hasta 2000 si hay bastantes
    final paraPdf = _todas.take(2000).toList();
    return const PdfGenerator().generarPdf(paraPdf);
  }

  // ── Reset ─────────────────────────────────────────────────────────────────

  /// Limpia los resultados y cancela cualquier generación en curso.
  void limpiar() {
    _cancelarIsolate();
    _todas.clear();
    _paginaActual = 1;
    state = const CombinacionesState();
  }
}

// ── Provider ──────────────────────────────────────────────────────────────────

final combinacionesProvider =
    NotifierProvider<CombinacionesNotifier, CombinacionesState>(
  () => CombinacionesNotifier(),
);
