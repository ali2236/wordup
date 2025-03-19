import 'package:wordup/domain/feature/theme/repository/repository_theme.dart';

import '../model/theme.dart';

class GetThemeUseCase {
  final ThemeRepository _repository;

  GetThemeUseCase(this._repository);

  List<AppThemeData> getThemes() {
    return _repository.getThemes();
  }

  AppThemeData call() {
    return _repository.getTheme();
  }
}
