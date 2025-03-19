import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordup/common/colors.dart';
import 'package:wordup/domain/feature/theme/model/theme_base.dart';
import 'theme.dart';

class LightTheme extends AppThemeData {
  @override
  String get id => 'light';

  @override
  ThemeData buildTheme(BuildContext context) {
    final base = BaseTheme().buildTheme(context);
    final textColor = AppColors.eggplant;

    TextStyle poppinsTextStyle(FontWeight weight) {
      return GoogleFonts.poppins(fontWeight: weight, color: textColor);
    }

    return base.copyWith(
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: textColor),
      textTheme: TextTheme(
        displayLarge: poppinsTextStyle(FontWeight.w700),
        displayMedium: poppinsTextStyle(FontWeight.w700),
        displaySmall: poppinsTextStyle(FontWeight.w700),
        headlineLarge: poppinsTextStyle(FontWeight.w600),
        headlineMedium: poppinsTextStyle(FontWeight.w600),
        headlineSmall: poppinsTextStyle(FontWeight.w600),
        titleLarge: poppinsTextStyle(FontWeight.w600),
        titleMedium: poppinsTextStyle(FontWeight.w500),
        titleSmall: poppinsTextStyle(FontWeight.w500),
        bodyLarge: poppinsTextStyle(FontWeight.w400),
        bodyMedium: poppinsTextStyle(FontWeight.w400),
        bodySmall: poppinsTextStyle(FontWeight.w400),
        labelLarge: poppinsTextStyle(FontWeight.w500),
        labelMedium: poppinsTextStyle(FontWeight.w500),
        labelSmall: poppinsTextStyle(FontWeight.w500),
      ),
    );
  }
}
