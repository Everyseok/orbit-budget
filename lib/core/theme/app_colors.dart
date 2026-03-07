import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color spaceBlack = Color(0xFF0A0A0F);
  static const Color deepSpace = Color(0xFF111118);
  static const Color panelBg = Color(0xFF1A1A24);
  static const Color electricBlue = Color(0xFF00D4FF);
  static const Color neonGreen = Color(0xFF39FF14);
  static const Color alertRed = Color(0xFFFF3B30);
  static const Color mutedGray = Color(0xFF8888AA);
  static const Color white = Color(0xFFFFFFFF);

  // Opacity helpers — use withValues, not withOpacity
  static Color blueSubtle = electricBlue.withValues(alpha: 0.30);
  static Color greenSubtle = neonGreen.withValues(alpha: 0.30);
  static Color redSubtle = alertRed.withValues(alpha: 0.30);

  static List<BoxShadow> get blueGlow => [
        BoxShadow(
          color: electricBlue.withValues(alpha: 0.25),
          blurRadius: 12,
          spreadRadius: 0,
        ),
        BoxShadow(
          color: electricBlue.withValues(alpha: 0.08),
          blurRadius: 24,
          spreadRadius: 4,
        ),
      ];

  static List<BoxShadow> get greenGlow => [
        BoxShadow(
          color: neonGreen.withValues(alpha: 0.20),
          blurRadius: 10,
          spreadRadius: 0,
        ),
      ];
}
