import 'package:flutter/material.dart';
import 'package:wordup/domain/feature/theme/model/theme.dart';

class BaseTheme extends AppThemeData {
  @override
  String get id => 'base';

  @override
  ThemeData buildTheme(BuildContext context) {
    final accent1 = Color(0xff911ecc);
    final accent2 = Color(0xff33bdd2);
    final accent3 = Color(0xffbe4ff7);
    return ThemeData(
      fontFamily: 'Poppins',
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: accent1,
        secondary: accent2,
        tertiary: Color(0xff8349A9),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: Color(0xffeef2f8),
        onSurface: Color(0xff3a1351),
        onInverseSurface: Color(0xffD9DDED),
      ),
      cardTheme: CardTheme(elevation: 0, color: Colors.white),
      dividerTheme: DividerThemeData(
        color: Colors.black.withAlpha(50),
        thickness: 0.4,
      ),
      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Color(0xffd9dded),
      ),
      inputDecorationTheme: InputDecorationTheme(
        outlineBorder: BorderSide.none,
        filled: true,
        fillColor: Color(0xffeef2f8),
      ),
    );
  }
}
