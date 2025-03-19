// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordResult _$WordResultFromJson(Map<String, dynamic> json) => WordResult(
  id: (json['id'] as num).toInt(),
  word: json['word'] as String,
  rank: (json['rank'] as num).toInt(),
  otherForms:
      (json['otherForms'] as List<dynamic>).map((e) => e as String).toList(),
  primarySenseId: json['primarySenseId'] as String,
  phonetics: (json['phonetics'] as Map<String, dynamic>).map(
    (k, e) => MapEntry($enumDecode(_$AccentEnumMap, k), e as String),
  ),
);

Map<String, dynamic> _$WordResultToJson(WordResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'rank': instance.rank,
      'primarySenseId': instance.primarySenseId,
      'otherForms': instance.otherForms,
      'phonetics': instance.phonetics.map(
        (k, e) => MapEntry(_$AccentEnumMap[k]!, e),
      ),
    };

const _$AccentEnumMap = {
  Accent.british: 'british',
  Accent.american: 'american',
};
