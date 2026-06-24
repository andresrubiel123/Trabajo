import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';

/// Widget unificado para renderizar logos de equipos o ligas.
///
/// Detecta automáticamente si la imagen es SVG o rasterizada (PNG/JPG/WebP).
/// Para imágenes rasterizadas usa [CachedNetworkImage] para persistir el archivo
/// en disco del dispositivo tras el primer uso — elimina descargas repetidas.
class TeamLogo extends StatelessWidget {
  /// URL de la imagen del logo. Puede ser SVG o rasterizado.
  final String? logoUrl;

  /// Ancho deseado en píxeles lógicos.
  final double width;

  /// Alto deseado en píxeles lógicos.
  final double height;

  /// Ícono a mostrar si la URL es nula, vacía o falla la descarga.
  final IconData fallbackIcon;

  /// Tamaño del ícono de fallback.
  final double fallbackIconSize;

  /// Constructor para [TeamLogo].
  const TeamLogo({
    super.key,
    required this.logoUrl,
    this.width = 24,
    this.height = 24,
    this.fallbackIcon = Icons.sports_soccer,
    this.fallbackIconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    if (logoUrl == null || logoUrl!.trim().isEmpty) {
      return _fallback();
    }

    final url = logoUrl!.trim();
    final isSvg = url.toLowerCase().endsWith('.svg') || url.contains('.svg?');

    return isSvg ? _buildSvg(url) : _buildRaster(url);
  }

  // ── SVG ───────────────────────────────────────────────────────────────────

  Widget _buildSvg(String url) {
    return SvgPicture.network(
      url,
      width: width,
      height: height,
      placeholderBuilder: (_) => _loader(),
    );
  }

  // ── Raster con CachedNetworkImage ─────────────────────────────────────────

  Widget _buildRaster(String url) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: BoxFit.contain,
      placeholder: (_, _) => _loader(),
      errorWidget: (_, _, _) => _fallback(),
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  Widget _loader() {
    return SizedBox(
      width: width,
      height: height,
      child: const Center(
        child: SizedBox(
          width: 14,
          height: 14,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.premiumBlue),
          ),
        ),
      ),
    );
  }

  Widget _fallback() {
    return Icon(
      fallbackIcon,
      size: fallbackIconSize,
      color: AppColors.textSecondary,
    );
  }
}
