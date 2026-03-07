import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orbit_budget/core/theme/app_colors.dart';
import 'package:orbit_budget/core/theme/app_typography.dart';

ThemeData buildAppTheme() {
  // M3: start from ColorScheme.fromSeed, then override individual roles
  final base = ColorScheme.fromSeed(
    seedColor: AppColors.electricBlue,
    brightness: Brightness.dark,
  ).copyWith(
    surface: AppColors.panelBg,
    onSurface: AppColors.white,
    primary: AppColors.electricBlue,
    onPrimary: AppColors.spaceBlack,
    secondary: AppColors.neonGreen,
    onSecondary: AppColors.spaceBlack,
    error: AppColors.alertRed,
    onError: AppColors.white,
    // surfaceContainerHighest replaces deprecated 'background' role
    surfaceContainerHighest: AppColors.spaceBlack,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: base,
    scaffoldBackgroundColor: AppColors.spaceBlack,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.deepSpace,
      foregroundColor: AppColors.white,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: AppTypography.headlineMedium(),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.deepSpace,
      selectedItemColor: AppColors.electricBlue,
      unselectedItemColor: AppColors.mutedGray,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),

    cardTheme: CardThemeData(
      color: AppColors.panelBg,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.deepSpace,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.blueSubtle),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.blueSubtle),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            const BorderSide(color: AppColors.electricBlue, width: 1.5),
      ),
      labelStyle: const TextStyle(color: AppColors.mutedGray),
      hintStyle: const TextStyle(color: AppColors.mutedGray),
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.deepSpace,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.panelBg,
      contentTextStyle:
          GoogleFonts.spaceGrotesk(color: AppColors.white),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
    ),

    dividerTheme: DividerThemeData(
      color: AppColors.blueSubtle,
      thickness: 0.5,
    ),

    listTileTheme: const ListTileThemeData(
      tileColor: Colors.transparent,
      textColor: AppColors.white,
      iconColor: AppColors.mutedGray,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.electricBlue,
        foregroundColor: AppColors.spaceBlack,
        minimumSize: const Size.fromHeight(48),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: GoogleFonts.spaceGrotesk(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.electricBlue,
        textStyle:
            GoogleFonts.spaceGrotesk(fontWeight: FontWeight.w500),
      ),
    ),

    chipTheme: ChipThemeData(
      backgroundColor: AppColors.panelBg,
      selectedColor: AppColors.blueSubtle,
      side: BorderSide(color: AppColors.blueSubtle),
      labelStyle: GoogleFonts.spaceGrotesk(
        color: AppColors.white,
        fontSize: 12,
      ),
    ),
  );
}
