import 'package:flutter/material.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';

class GlowText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final bool glow;

  const GlowText(
    this.text, {
    super.key,
    this.fontSize = 20,
    this.color,
    this.glow = true,
  });

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.electricBlue;
    return Text(
      text,
      style: AppTypography.amount(fontSize: fontSize, color: c).copyWith(
        shadows: glow
            ? [Shadow(color: c.withValues(alpha: 0.6), blurRadius: 8)]
            : null,
      ),
    );
  }
}
