import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wordup/domain/domain.dart';

class AccentProvider extends ChangeNotifier {
  final AccentRepository _repository;
  late Accent _accent;

  AccentProvider(this._repository) {
    _accent = _repository.getAccent();
  }

  static AccentProvider of(BuildContext context) {
    return context.read<AccentProvider>();
  }

  static AccentProvider watch(BuildContext context) {
    return context.watch<AccentProvider>();
  }

  Accent get accent => _accent;

  void setAccent(Accent accent) {
    if (_accent != accent) {
      _accent = accent;
      _repository.setAccent(accent);
      notifyListeners();
    }
  }
}