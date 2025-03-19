// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_sense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordSense _$WordSenseFromJson(Map<String, dynamic> json) => WordSense(
  id: json['id'] as String,
  title: json['title'] as String,
  type: json['type'] as String,
  definition: json['definition'] as String,
  example: json['example'] as String,
  tips:
      (json['tips'] as List<dynamic>)
          .map((e) => SenseTip.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$WordSenseToJson(WordSense instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'type': instance.type,
  'definition': instance.definition,
  'example': instance.example,
  'tips': instance.tips,
};
