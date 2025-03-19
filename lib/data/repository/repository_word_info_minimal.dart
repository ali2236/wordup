import 'package:wordup/core/core.dart';
import 'package:wordup/data/filters/filter_query_string.dart';
import 'package:wordup/data/model/word_info_minimal.dart';
import 'package:wordup/domain/domain.dart';

class WordInfoMinimalRepository
    extends Repository<WordResult, int, StringQueryFilter> {
  final DataSource<MinimalWordInfo, int, StringQueryFilter> _local, _remote;

  const WordInfoMinimalRepository(this._local, this._remote);

  @override
  Stream<WordResult> get(int id) async* {
    try {
      // First try to get from local cache
      await for (final wordInfo in _local.getStreaming(id)) {
        yield _map(wordInfo);
        return;
      }

      // If not found locally, get from remote
      await for (final wordInfo in _remote.getStreaming(id)) {
        // Cache the word info locally
        await _local.create(wordInfo);
        yield _map(wordInfo);
      }
    } catch (e) {
      yield* Stream.error(e);
    }
  }

  @override
  Stream<List<WordResult>> getAll(StringQueryFilter? filter) async* {
    await for (final result in _remote.getAll(filter)) {
      for (final wordInfo in result) {
        await _local.create(wordInfo);
      }
      yield result.map(_map).toList();
    }
  }

  WordResult _map(MinimalWordInfo e) {
    return WordResult(
      id: e.id,
      word: e.text,
      rank: e.rank,
      otherForms: e.otherForms..removeWhere((w) => w == e.text),
      primarySenseId: e.primarySenseId,
      phonetics: {
        Accent.american: e.americanPhonetic,
        Accent.british: e.britishPhonetic,
      },
    );
  }
}
