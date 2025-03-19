import 'package:json_annotation/json_annotation.dart';
import 'package:wordup/domain/domain.dart';

part 'word_comparison.g.dart';

@JsonSerializable()
class WordComparison {
  final String word;
  final String description;
  final WordResult info;

  const WordComparison({
    required this.word,
    required this.description,
    required this.info,
  });

  static const fromJson = _$WordComparisonFromJson;
}
