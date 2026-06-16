import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_typography.dart';
import 'gradient_text.dart';

/// Botón con fondo negro, borde azul premium y destello shimmer horizontal en hover.
class NeonButton extends StatefulWidget {
  const NeonButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color,
    this.isLoading = false,
    this.isOutlined = false,
    this.width,
    this.height = 50,
    this.fontSize,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? color;
  final bool isLoading;
  final bool isOutlined;
  final double? width;
  final double height;
  final double? fontSize;

  @override
  State<NeonButton> createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shimmerAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
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
    if (widget.onPressed != null && !widget.isLoading) {
      _controller.forward(from: 0.0);
    }
  }

  void _onHoverExit() {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final borderBlue = widget.color ?? AppColors.premiumBlue;
    final isDisabled = widget.onPressed == null || widget.isLoading;

    return MouseRegion(
      onEnter: (_) => _onHoverEnter(),
      onExit: (_) => _onHoverExit(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.black, // Fondo negro para todos los botones
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDisabled 
                ? AppColors.border 
                : (_isHovered ? borderBlue : borderBlue.withValues(alpha: 0.7)),
            width: widget.isOutlined ? 1.5 : 1.0,
          ),
          boxShadow: isDisabled
              ? null
              : (_isHovered
                  ? [
                      BoxShadow(
                        color: AppColors.premiumBlue.withValues(alpha: 0.3),
                        blurRadius: 12,
                        spreadRadius: 1,
                      )
                    ]
                  : null),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              // Contenido del Botón
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: isDisabled ? null : widget.onPressed,
                  borderRadius: BorderRadius.circular(12),
                  child: Center(
                    child: widget.isLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.primary,
                            ),
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.icon != null) ...[
                                ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (bounds) => AppColors.primaryGradient.createShader(
                                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                                  ),
                                  child: Icon(
                                    widget.icon,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                              GradientText(
                                widget.label,
                                style: AppTypography.labelLarge.copyWith(
                                  fontSize: widget.fontSize ?? 15,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
              // Efecto shimmer horizontal al pasar cursor
              Positioned.fill(
                child: IgnorePointer(
                  child: AnimatedBuilder(
                    animation: _shimmerAnimation,
                    builder: (context, child) {
                      if (!_isHovered && _controller.isDismissed) {
                        return const SizedBox.shrink();
                      }
                      return FractionallySizedBox(
                        widthFactor: 0.3,
                        alignment: Alignment(_shimmerAnimation.value, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withValues(alpha: 0.0),
                                Colors.white.withValues(alpha: 0.15),
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
    );
  }
}
