import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';

class AppTypography {
  const AppTypography._();

  static TextStyle displayLarge() => GoogleFonts.spaceGrotesk(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
        letterSpacing: -0.5,
      );

  static TextStyle headlineMedium() => GoogleFonts.spaceGrotesk(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      );

  static TextStyle bodyMedium() => GoogleFonts.spaceGrotesk(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      );

  static TextStyle labelSmall() => GoogleFonts.spaceGrotesk(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.mutedGray,
        letterSpacing: 1.2,
      );

  static TextStyle sectionLabel() => GoogleFonts.spaceGrotesk(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.mutedGray,
        letterSpacing: 2.0,
      );

  // KRW amounts — monospace
  static TextStyle amount({double fontSize = 20, Color? color}) =>
      GoogleFonts.shareTechMono(
        fontSize: fontSize,
        color: color ?? AppColors.electricBlue,
      );
}
