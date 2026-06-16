import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Tarjeta con efecto glassmorphism, fondo negro, borde azul premium y efecto shimmer en hover.
class GlassCard extends StatefulWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.blur = 10.0,
    this.backgroundOpacity = 1.0, // Fondo negro por defecto (1.0)
    this.glowColor,
    this.width,
    this.height,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Color? borderColor;
  final double blur;
  final double backgroundOpacity;
  final Color? glowColor;
  final double? width;
  final double? height;

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shimmerAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _shimmerAnimation = Tween<double>(begin: -2.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHoverEnter() {
    setState(() {
      _isHovered = true;
    });
    _controller.forward(from: 0.0);
  }

  void _onHoverExit() {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final radius = widget.borderRadius ?? 16.0;
    final border = widget.borderColor ?? AppColors.glassBorder;
    final glow = widget.glowColor;

    return MouseRegion(
      onEnter: (_) => _onHoverEnter(),
      onExit: (_) => _onHoverExit(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: glow != null
              ? [
                  BoxShadow(
                    color: glow.withAlpha(51),
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),
                ]
              : (_isHovered
                  ? [
                      BoxShadow(
                        color: AppColors.premiumBlue.withAlpha(38),
                        blurRadius: 12,
                        spreadRadius: 1,
                      )
                    ]
                  : null),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: widget.blur, sigmaY: widget.blur),
            child: Stack(
              children: [
                // Fondo negro y borde azul
                Container(
                  padding: widget.padding ?? const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: widget.backgroundOpacity),
                    borderRadius: BorderRadius.circular(radius),
                    border: Border.all(color: border, width: 0.8),
                  ),
                  child: widget.child,
                ),
                // Destello Shimmer horizontal en hover
                Positioned.fill(
                  child: IgnorePointer(
                    child: AnimatedBuilder(
                      animation: _shimmerAnimation,
                      builder: (context, child) {
                        if (!_isHovered && _controller.isDismissed) {
                          return const SizedBox.shrink();
                        }
                        return FractionallySizedBox(
                          widthFactor: 0.4,
                          alignment: Alignment(_shimmerAnimation.value, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withValues(alpha: 0.0),
                                  Colors.white.withValues(alpha: 0.12),
                                  Colors.white.withValues(alpha: 0.0),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
