import 'package:json_annotation/json_annotation.dart';
import 'package:wordup/common/types.dart';
import 'package:wordup/domain/entity/sense_tip.dart';

import '../../common/uris.dart';

part 'word_sense.g.dart';

@JsonSerializable()
class WordSense {
  final UUID id;
  final String title;
  final String type;
  final String definition;
  final String example;
  final List<SenseTip> tips;

  const WordSense({
    required this.id,
    required this.title,
    required this.type,
    required this.definition,
    required this.example,
    required this.tips,
  });

  static const fromJson = _$WordSenseFromJson;

  Uri get image =>  imageCDN.resolve('/senses/$id.webp?v=1');

  Uri get video => imageCDN.resolve('/video/$id.mp4');

  Uri get audio => speechCDN.resolve('/senses/all/gb/m/$id.mp3');
}
