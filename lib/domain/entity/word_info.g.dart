// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordInfo _$WordInfoFromJson(Map<String, dynamic> json) => WordInfo(
  id: (json['id'] as num).toInt(),
  word: json['word'] as String,
  otherForms:
      (json['otherForms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  rank: (json['rank'] as num).toInt(),
  primarySenseId: json['primarySenseId'] as String,
  senses:
      (json['senses'] as List<dynamic>)
          .map((e) => WordSense.fromJson(e as Map<String, dynamic>))
          .toList(),
  americanPhonetics: json['americanPhonetics'] as String,
  britishPhonetics: json['britishPhonetics'] as String,
  compare:
      (json['compare'] as List<dynamic>)
          .map((e) => WordComparison.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$WordInfoToJson(WordInfo instance) => <String, dynamic>{
  'id': instance.id,
  'word': instance.word,
  'primarySenseId': instance.primarySenseId,
  'otherForms': instance.otherForms,
  'senses': instance.senses,
  'britishPhonetics': instance.britishPhonetics,
  'americanPhonetics': instance.americanPhonetics,
  'rank': instance.rank,
  'compare': instance.compare,
};
