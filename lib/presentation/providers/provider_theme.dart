import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordup/domain/feature/theme/model/theme.dart';
import 'package:wordup/domain/feature/theme/repository/repository_theme.dart';

class ThemeProvider extends ChangeNotifier {
  final ThemeRepository _repository;
  late AppThemeData _currentTheme;

  ThemeProvider(this._repository) {
    _currentTheme = _repository.getTheme();
  }

  AppThemeData get currentTheme => _currentTheme;

  void setTheme(AppThemeData theme) {
    _repository.setTheme(theme);
    _currentTheme = theme;
    notifyListeners();
  }

  void toggleTheme() {
    setTheme(
      _repository.getThemes().firstWhere((t) => t.id != currentTheme.id),
    );
  }

  static ThemeProvider of(BuildContext context) {
    return Provider.of<ThemeProvider>(context, listen: false);
  }

  static ThemeProvider watch(BuildContext context) {
    return Provider.of<ThemeProvider>(context);
  }
}
