// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sense _$SenseFromJson(Map<String, dynamic> json) => Sense(
  id: json['id'] as String,
  de: json['de'] as String,
  doo: json['do'] as String? ?? '',
  ty: json['ty'] as String,
  ex: json['ex'] as String,
  use: json['use'] as String,
  sy: json['sy'] as String? ?? '',
  op: json['op'] as String? ?? '',
  re: json['re'] as String? ?? '',
  tp: json['tp'] as String? ?? '',
  cl:
      (json['cl'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$SenseToJson(Sense instance) => <String, dynamic>{
  'id': instance.id,
  'de': instance.de,
  'do': instance.doo,
  'ty': instance.ty,
  'ex': instance.ex,
  'use': instance.use,
  'sy': instance.sy,
  'op': instance.op,
  're': instance.re,
  'tp': instance.tp,
  'cl': instance.cl,
};
