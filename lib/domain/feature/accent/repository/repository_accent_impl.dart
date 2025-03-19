import 'package:wordup/data/data.dart';
import '../model/accent.dart';
import 'repository_accent.dart';

class AccentRepositoryImpl extends AccentRepository {
  final KeyValueRepository _repository;

  AccentRepositoryImpl(this._repository);

  static const _key = 'accent_index';

  @override
  Accent getAccent() {
    final index = int.parse(_repository.get(_key) ?? '0');
    return Accent.values[index];
  }

  @override
  void setAccent(Accent accent) {
    _repository.put(_key, accent.index.toString());
  }
}