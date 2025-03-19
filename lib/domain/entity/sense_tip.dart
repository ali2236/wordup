import 'package:json_annotation/json_annotation.dart';

part 'sense_tip.g.dart';

@JsonSerializable()
class SenseTip {
  final String title;
  final String definition;
  final String example;

  const SenseTip({required this.title, required this.definition, required this.example});

  factory SenseTip.fromLine(String line){
    final parts = line.split("|");
    return SenseTip(
      title: parts[0],
      definition: parts[1],
      example: parts[2],
    );
  }

  static const fromJson = _$SenseTipFromJson;
}