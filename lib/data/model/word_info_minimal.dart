import 'package:json_annotation/json_annotation.dart';
import 'package:wordup/common/types.dart';
import '../../core/model/model.dart';

part 'word_info_minimal.g.dart';

@JsonSerializable()
class MinimalWordInfo implements Model<int> {
  @override
  final int id;
  final int rank;
  final String text;
  final List<String> otherForms;
  final String primaryMeaning;
  final String primarySenseId;
  final String type;
  final String britishPhonetic;
  final String americanPhonetic;

  const MinimalWordInfo({
    required this.id,
    this.rank = 1,
    required this.text,
    required this.otherForms,
     this.primaryMeaning = '',
    required this.primarySenseId,
     this.type = '',
    required this.britishPhonetic,
    required this.americanPhonetic,
  });

  factory MinimalWordInfo.fromLine(String line){
    final parts = line.split('|');
    return MinimalWordInfo(
      id: int.parse(parts[0]),
      rank: int.parse(parts[1]),
      text: parts[2],
      otherForms:
      parts[3].split(",").toList()..removeWhere((s) => s.isEmpty),
      primarySenseId: parts[4],
      type: parts[5] == '1' ? 'word' : 'phrase',
      britishPhonetic: parts[6],
      americanPhonetic: parts[7],
    );
  }

  static const fromJson = _$MinimalWordInfoFromJson;


  @override
  JSON toJson() => _$MinimalWordInfoToJson(this);
}
