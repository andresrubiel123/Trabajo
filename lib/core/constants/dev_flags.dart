/// Flags globales de configuración del entorno de desarrollo.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-24
///
/// IMPORTANTE: Cambiar [kModoDesarrollo] a false antes de publicar en
/// producción para activar las restricciones de suscripción premium.
library;

/// Activa el modo de desarrollo.
///
/// Cuando es [true]:
/// - Todos los usuarios tienen acceso a todas las funciones de la app.
/// - Las restricciones de suscripción premium son omitidas.
/// - Se muestra un indicador visual "DEV" en la UI.
///
/// Cambiar a [false] en builds de producción/staging.
const bool kModoDesarrollo = true;

/// Versión de entorno actual para logging.
const String kEntorno = kModoDesarrollo ? 'DESARROLLO' : 'PRODUCCION';

/// Habilita logs detallados en consola (solo modo desarrollo).
const bool kLogsDetallados = kModoDesarrollo;

/// Habilita Isar Inspector (herramienta de debug para la BD local).
const bool kIsarInspector = false; // Cambiar a true puntualmente para debug de BD
