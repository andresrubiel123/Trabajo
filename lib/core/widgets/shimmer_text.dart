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
      duration: const Duration(seconds: 10), // Ciclo completo de 10 segundos
    )..repeat();

    _shimmerAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: -1.5, end: 1.5).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 15.0, // 15% del ciclo = 1.5 segundos barriendo el texto
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(1.5),
        weight: 85.0, // 85% del ciclo = 8.5 segundos de espera al final (oculto)
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
              colors: [
                const Color(0xFFF8FAFC), // Blanco pizarra muy claro (Slate 50)
                const Color(0xFF94A3B8), // Gris pizarra suave (Slate 400)
                Colors.white,            // Brillo metálico blanco puro (Diamante)
                const Color(0xFF94A3B8), // Gris pizarra suave
                const Color(0xFFF8FAFC), // Blanco pizarra
              ],
              stops: [
                0.0,
                (val - 0.25).clamp(0.0, 1.0),
                val.clamp(0.0, 1.0),
                (val + 0.25).clamp(0.0, 1.0),
                1.0,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
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
