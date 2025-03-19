import 'package:json_annotation/json_annotation.dart';
import 'package:wordup/common/types.dart';
import 'package:wordup/common/uris.dart';
import 'package:wordup/domain/domain.dart';

import '../../core/core.dart';

part 'word_result.g.dart';

@JsonSerializable()
class WordResult implements Model<int> {
  @override
  final int id;
  final String word;
  final int rank;
  final UUID primarySenseId;
  final List<String> otherForms;
  final Map<Accent, String> phonetics;

  const WordResult({
    required this.id,
    required this.word,
    required this.rank,
    required this.otherForms,
    required this.primarySenseId,
    required this.phonetics,
  });

  static const fromJson = _$WordResultFromJson;

  Uri get image => imageCDN.resolve('/senses/$primarySenseId.webp?v=1');

  @override
  JSON toJson() => _$WordResultToJson(this);
}
