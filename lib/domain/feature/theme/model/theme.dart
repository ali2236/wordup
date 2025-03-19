import 'package:flutter/material.dart';

abstract class AppThemeData {
  String get id;
  ThemeData buildTheme(BuildContext context);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppThemeData && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
