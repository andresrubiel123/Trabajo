import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    this.style,
    this.gradient,
    this.textAlign,
  });

  final String text;
  final TextStyle? style;
  final Gradient? gradient;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final activeGradient = gradient ?? AppColors.primaryGradient;

    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => activeGradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style?.copyWith(color: Colors.white) ?? const TextStyle(color: Colors.white),
        textAlign: textAlign,
      ),
    );
  }
}
