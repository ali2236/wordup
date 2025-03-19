import 'package:wordup/domain/feature/theme/model/theme.dart';
import 'package:wordup/domain/feature/theme/repository/repository_theme.dart';

class ChangeThemeUseCase {
  final ThemeRepository _repository;

  ChangeThemeUseCase(this._repository);

  void call(AppThemeData theme) {
    _repository.setTheme(theme);
  }
}
