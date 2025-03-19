import 'package:wordup/data/repository/repository_key_value.dart';
import 'package:wordup/domain/feature/theme/model/theme.dart';
import 'package:wordup/domain/feature/theme/model/theme_dark.dart';
import 'package:wordup/domain/feature/theme/model/theme_light.dart';
import 'package:wordup/domain/feature/theme/repository/repository_theme.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final KeyValueRepository _keyValueRepository;

  ThemeRepositoryImpl(this._keyValueRepository);

  static const _key_theme = 'theme_id';

  final _themes = [LightTheme(), DarkTheme()];

  @override
  AppThemeData getTheme() {
    final tid = _keyValueRepository.get(_key_theme);
    return _themes.where((t) => t.id == tid).firstOrNull ?? _themes.first;
  }

  @override
  List<AppThemeData> getThemes() => _themes;

  @override
  void setTheme(AppThemeData theme) async {
    await _keyValueRepository.put(_key_theme, theme.id);
  }
}
