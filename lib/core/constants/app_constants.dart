/// Constantes globales y configuraciones generales del sistema.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

class AppConstants {
  AppConstants._();

  static const String appName = 'ApuestasFutbol';
  static const String appVersion = '1.0.0';
  static const String appTagline = 'COMBINADOR PROFESIONAL';

  // ── Auth ──────────────────────────────────────────────────────────────
  static const String defaultUser = 'aaaa';
  static const String defaultPassword = 'aaaa';

  // ── Lógica de combinaciones ──────────────────────────────────────────
  static const int maxConsecutivosIguales = 4;
  static const int maxPartidos = 15;
  static const int minPartidos = 1;

  /// Cuántas combinaciones se emiten por lote desde el Isolate al hilo principal.
  static const int streamingBatchSize = 500;

  static const List<String> resultadosDisponibles = [
    'Local',
    'Empate',
    'Visitante',
  ];

  static const List<String> resultadosCortos = ['L', 'E', 'V'];

  // ── Isar / Sync ───────────────────────────────────────────────────────────
  /// Nombre de la base de datos Isar.
  static const String isarDbName = 'gol_saint';

  /// Versión del seed actualmente incluido en la APK.
  /// Incrementar cuando se actualicen los archivos JSON seed.
  static const int seedVersion = 1;

  // ── Responsive Breakpoints ────────────────────────────────────────────
  /// Ancho máximo para layout mobile (BottomNavigationBar).
  static const double mobileBreakpoint = 600.0;
  /// Ancho máximo para layout tablet (NavRail colapsado).
  static const double tabletBreakpoint = 1024.0;

  // ── UI ────────────────────────────────────────────────────────────────
  static const double navRailWidth = 220.0;
  static const double navRailCollapsedWidth = 72.0;
  static const double borderRadiusCard = 16.0;
  static const double borderRadiusButton = 12.0;
  static const double spacingXS = 4.0;
  static const double spacingSM = 8.0;
  static const double spacingMD = 16.0;
  static const double spacingLG = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;
}
