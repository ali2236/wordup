import 'package:json_annotation/json_annotation.dart';
import 'package:wordup/common/types.dart';
import 'package:wordup/common/uris.dart';
import 'package:wordup/domain/domain.dart';
import 'package:wordup/domain/entity/word_comparison.dart';
import '../../core/core.dart';

part 'word_info.g.dart';

@JsonSerializable()
class WordInfo extends Model<int> {
  @override
  final int id;
  final String word;
  final UUID primarySenseId;
  final List<String> otherForms;
  final List<WordSense> senses;
  final String britishPhonetics, americanPhonetics;
  final int rank;
  final List<WordComparison> compare;


  WordInfo({
    required this.id,
    required this.word,
    this.otherForms = const [],
    required this.rank,
    required this.primarySenseId,
    required this.senses,
    required this.americanPhonetics,
    required this.britishPhonetics,
    required this.compare,
  });

  Uri get wordPronunciation {
    final accent = locate<AccentRepository>().getAccent();
    final gender = 'f'; // Random().nextBool() ? 'f' : 'm';
    return speechCDN.resolve('/words/all/${accent.code}/$gender/$id.mp3');
  }

  @override
  JSON toJson() {
    throw UnimplementedError();
  }

  String getPhonetics(Accent accent) {
    return switch(accent){
      Accent.british => britishPhonetics,
      Accent.american => americanPhonetics,
    };
  }
}
