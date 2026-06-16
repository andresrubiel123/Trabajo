import 'package:flutter/material.dart';

/// Un widget que muestra texto con degradado gris/blanco metálico muy suave
/// y un destello horizontal brillante (efecto diamante) que pasa cada 10 segundos.
class ShimmerText extends StatefulWidget {
  const ShimmerText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  State<ShimmerText> createState() => _ShimmerTextState();
}

class _ShimmerTextState extends State<ShimmerText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // Duración más natural
    )..repeat();

    _shimmerAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: -2.5, end: 2.5).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 40.0, // 40% del tiempo haciendo el barrido
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(2.5),
        weight: 60.0, // 60% del tiempo de espera al final
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shimmerAnimation,
      builder: (context, child) {
        final val = _shimmerAnimation.value;
        return ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: const [
                Color(0xFF94A3B8), // Gris base
                Color(0xFFF8FAFC), // Brillo metálico blanco puro
                Color(0xFF94A3B8), // Gris base
              ],
              stops: const [
                0.15,
                0.5,
                0.85,
              ],
              begin: Alignment(val - 1.0, -0.3),
              end: Alignment(val + 1.0, 0.3),
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
          },
          child: Text(
            widget.text,
            style: widget.style?.copyWith(color: Colors.white) ?? const TextStyle(color: Colors.white),
            textAlign: widget.textAlign,
          ),
        );
      },
    );
  }
}
