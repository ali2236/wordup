import 'package:wordup/data/data.dart';
import 'package:wordup/domain/domain.dart';
import '../../core/core.dart';

class WordInfoRepository extends Repository<WordInfo, int, void> {
  final WordRepository _wordRepository;
  final WordInfoMinimalRepository _wordInfoMinimalRepository;

  WordInfoRepository(this._wordRepository, this._wordInfoMinimalRepository);

  @override
  Future<void> add(WordInfo model) {
    throw UnimplementedError();
  }

  @override
  Stream<WordInfo> get(int id) async* {
    final word = await _wordRepository.get(id).first;
    final info = await _wordInfoMinimalRepository.get(id).first;

    final senses = getAllWordSenses(word, info);
    final compare = await getAllWordComparisons(word);

    final wordInfo = WordInfo(
      id: id,
      word: info.word,
      rank: info.rank,
      otherForms: info.otherForms,
      primarySenseId: info.primarySenseId,
      senses: senses,
      americanPhonetics: info.phonetics[Accent.american]!,
      britishPhonetics: info.phonetics[Accent.british]!,
      compare: compare,
    );

    yield* Stream.value(wordInfo);
  }

  List<WordSense> getAllWordSenses(Word word, WordResult info){
    return (word.senses + word.phrases).map((s) {
      final tipsRows = s.tp.split("\r\n");
      tipsRows.removeWhere((r) => r.isEmpty);
      final tips = tipsRows.map(SenseTip.fromLine).toList();

      if (s.cl.isNotEmpty) {
        tips.add(
          SenseTip(
            title: 'Collocations',
            definition: 'It often appears as:',
            example: s.cl.map((line) => '◆ $line').join('\n'),
          ),
        );
      }

      return WordSense(
        id: s.id,
        title: s.doo.trim().isEmpty ? info.word : s.doo,
        type: s.ty,
        definition: s.de,
        example: s.ex,
        tips: tips,
      );
    }).toList();
  }

  Future<List<WordComparison>> getAllWordComparisons(Word word) async{
    return (await Future.wait(
      word.comparisons.map((c) async {
        final comparisonParts = c.split("|");
        final word = comparisonParts[0];
        final description = comparisonParts[1];
        final info =
            (await _wordInfoMinimalRepository
                .getAll(StringQueryFilter(word))
                .first)
                .where(
                  (w) =>
              w.word.toLowerCase().trim() ==
                  word.toLowerCase().trim(),
            )
                .firstOrNull;
        if (info == null) return null;
        return WordComparison(
          word: word,
          description: description,
          info: info,
        );
      }),
    )).whereType<WordComparison>().toList();
  }
}
