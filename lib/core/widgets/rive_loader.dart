import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../constants/app_colors.dart';

/// Un widget de pantalla de carga animado premium que utiliza Rive.
///
/// Si no se proporciona una ruta de asset local, carga una animación oficial
/// de prueba de Rive desde la red.
class RiveLoader extends StatelessWidget {
  const RiveLoader({
    super.key,
    this.assetPath,
    this.networkUrl = 'https://cdn.rive.app/animations/vehicles.riv',
    this.animationName,
    this.stateMachineName,
    this.width = 150,
    this.height = 150,
    this.message = 'Cargando datos deportivos...',
  });

  /// Ruta del archivo local .riv (opcional).
  final String? assetPath;

  /// URL de red de respaldo para la animación .riv.
  final String networkUrl;

  /// Nombre de la animación específica a reproducir.
  final String? animationName;

  /// Nombre del State Machine (si el archivo usa máquinas de estado).
  final String? stateMachineName;

  /// Ancho del contenedor.
  final double width;

  /// Alto del contenedor.
  final double height;

  /// Mensaje descriptivo opcional para mostrar debajo de la animación.
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: width,
            height: height,
            child: RiveWidgetBuilder(
              fileLoader: assetPath != null
                  ? FileLoader.fromAsset(assetPath!, riveFactory: Factory.rive)
                  : FileLoader.fromUrl(networkUrl, riveFactory: Factory.rive),
              stateMachineSelector: stateMachineName != null
                  ? StateMachineSelector.byName(stateMachineName!)
                  : const StateMachineDefault(),
              builder: (context, state) {
                if (state is RiveLoaded) {
                  return RiveWidget(
                    controller: state.controller,
                    fit: Fit.contain,
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              },
            ),
          ),
          if (message.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              message,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
