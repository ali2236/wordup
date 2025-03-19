import 'package:wordup/core/core.dart';
import 'package:wordup/data/filters/filter_query_string.dart';
import 'package:wordup/data/model/word_info_minimal.dart';

class LocalWordInfoMinimalDataSource
    extends AssetDataSource<MinimalWordInfo, int, StringQueryFilter> {
  final Map<int, MinimalWordInfo> _words = {};

  LocalWordInfoMinimalDataSource(super.assetPath);

  @override
  Future<void> create(MinimalWordInfo model) async {
    if (!_words.containsKey(model.id)) {
      _words[model.id] = model;
    }
  }

  @override
  Future<void> delete(int id) async {}

  @override
  Future<void> update(MinimalWordInfo model) async {}

  Future<List<MinimalWordInfo>> _loadAll() async {
    if (_words.isEmpty) {
      final content = await load();
      final lines = content.split('\n');
      final words = lines.map(MinimalWordInfo.fromLine);
      _words.addAll({for (final word in words) word.id: word});
    }
    return _words.values.toList();
  }

  @override
  Stream<List<MinimalWordInfo>> getAll(StringQueryFilter? filter) async* {
    final words = await _loadAll();
    if (filter != null) {
      yield words.where((w) => w.text.contains(filter.query)).toList();
    } else {
      yield words;
    }
  }

  @override
  MinimalWordInfo? get(int id) {
    return _words.values.where((w) => w.id == id).firstOrNull;
  }
}
