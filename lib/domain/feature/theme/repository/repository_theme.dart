import 'package:wordup/domain/feature/theme/model/theme.dart';

abstract class ThemeRepository {
  List<AppThemeData> getThemes();
  void setTheme(AppThemeData theme);
  AppThemeData getTheme();
}
