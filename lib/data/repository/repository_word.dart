import '../../core/core.dart';
import '../model/word.dart';

class WordRepository extends Repository<Word, int, void> {
  final DataSource<Word, int, void> _remote, _local;

  const WordRepository(this._remote, this._local);

  @override
  Stream<Word> get(int id) async* {
    try {
      // First try to get from local cache
      await for (final word in _local.getStreaming(id)) {
        yield word;
        return;
      }

      // If not found locally, get from remote
      await for (final word in _remote.getStreaming(id)) {
        // Cache the word locally
        await _local.create(word);
        yield word;
      }
    } catch (e) {
      yield* Stream.error(e);
    }
  }
}
