// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) => Word(
  id: (json['Id'] as num?)?.toInt() ?? -1,
  usage: json['Usage'] as String? ?? '',
  senses:
      (json['Senses'] as List<dynamic>?)
          ?.map((e) => Sense.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  phrases:
      (json['Phrases'] as List<dynamic>?)
          ?.map((e) => Sense.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  quotes:
      (json['Quotes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  videos:
      (json['Videos'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  comparisons:
      (json['Comparisons'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  wisdom:
      (json['Wisdom'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  facts:
      (json['Facts'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  misspellings:
      json['Misspellings'] == null
          ? const []
          : splitPipes(json['Misspellings'] as String),
);

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
  'Id': instance.id,
  'Usage': instance.usage,
  'Senses': instance.senses,
  'Phrases': instance.phrases,
  'Quotes': instance.quotes,
  'Videos': instance.videos,
  'Comparisons': instance.comparisons,
  'Wisdom': instance.wisdom,
  'Facts': instance.facts,
  'Misspellings': instance.misspellings,
};
