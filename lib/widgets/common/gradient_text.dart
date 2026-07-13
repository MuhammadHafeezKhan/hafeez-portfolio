import 'package:flutter/material.dart';

import '../../core/app_colors.dart';


/// Renders [text] with a gradient fill instead of a flat color — the
/// subtle "premium headline" treatment used by Linear/Stripe-style sites.
class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;
  final TextAlign? textAlign;

  const GradientText(
    this.text, {
    super.key,
    required this.style,
    this.gradient = AppColors.accentGradient,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style.copyWith(color: Colors.white), textAlign: textAlign),
    );
  }
}
