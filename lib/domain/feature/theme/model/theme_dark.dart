import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordup/common/colors.dart';
import 'theme.dart';
import 'theme_base.dart';

class DarkTheme extends AppThemeData {
  @override
  String get id => 'dark';

  @override
  ThemeData buildTheme(BuildContext context) {
    final base = BaseTheme().buildTheme(context);
    final textColor = AppColors.light2;

    return ThemeData.dark(useMaterial3: true).copyWith(
      brightness: Brightness.dark,
      colorScheme: base.colorScheme.copyWith(
        brightness: Brightness.dark,
        primary: AppColors.violet2,
        tertiary: AppColors.turquoise,
        onSurface: AppColors.light2,
        surface: AppColors.dark2,
        onSurfaceVariant: AppColors.light2,
        onInverseSurface: AppColors.dark4,
      ),
      cardTheme: base.cardTheme.copyWith(color: AppColors.dark2),
      dividerTheme: base.dividerTheme.copyWith(color: AppColors.light2),
      iconTheme: IconThemeData(color: AppColors.light2),
      popupMenuTheme: base.popupMenuTheme.copyWith(
        color: AppColors.dark4,
        textStyle: TextStyle(color: AppColors.light2),
      ),
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
        displayMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
        displaySmall: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
        headlineLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
        titleLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
        titleMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        titleSmall: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
        bodySmall: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
        labelLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        labelMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        labelSmall: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
