// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_info_minimal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MinimalWordInfo _$MinimalWordInfoFromJson(Map<String, dynamic> json) =>
    MinimalWordInfo(
      id: (json['id'] as num).toInt(),
      rank: (json['rank'] as num?)?.toInt() ?? 1,
      text: json['text'] as String,
      otherForms:
          (json['otherForms'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      primaryMeaning: json['primaryMeaning'] as String? ?? '',
      primarySenseId: json['primarySenseId'] as String,
      type: json['type'] as String? ?? '',
      britishPhonetic: json['britishPhonetic'] as String,
      americanPhonetic: json['americanPhonetic'] as String,
    );

Map<String, dynamic> _$MinimalWordInfoToJson(MinimalWordInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rank': instance.rank,
      'text': instance.text,
      'otherForms': instance.otherForms,
      'primaryMeaning': instance.primaryMeaning,
      'primarySenseId': instance.primarySenseId,
      'type': instance.type,
      'britishPhonetic': instance.britishPhonetic,
      'americanPhonetic': instance.americanPhonetic,
    };
