import 'package:json_annotation/json_annotation.dart';
import 'package:wordup/common/types.dart';
import '../../core/core.dart';
import 'sense.dart';

part 'word.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class Word extends Model<int> {
  @override
  final int id;
  final String usage;
  final List<Sense> senses;
  final List<Sense> phrases;
  final List<String> quotes;
  final List<String> videos;
  final List<String> comparisons;
  final List<String> wisdom;
  final List<String> facts;
  @JsonKey(fromJson: splitPipes)
  final List<String> misspellings;

  Word({
    this.id = -1,
    this.usage = '',
    this.senses = const [],
    this.phrases = const [],
    this.quotes = const [],
    this.videos = const [],
    this.comparisons = const [],
    this.wisdom = const [],
    this.facts = const [],
    this.misspellings = const [],
  });

  static const fromJson = _$WordFromJson;

  @override
  JSON toJson() => _$WordToJson(this);
}
