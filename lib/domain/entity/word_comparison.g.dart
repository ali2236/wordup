// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_comparison.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordComparison _$WordComparisonFromJson(Map<String, dynamic> json) =>
    WordComparison(
      word: json['word'] as String,
      description: json['description'] as String,
      info: WordResult.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WordComparisonToJson(WordComparison instance) =>
    <String, dynamic>{
      'word': instance.word,
      'description': instance.description,
      'info': instance.info,
    };
