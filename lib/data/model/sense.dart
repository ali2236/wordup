import 'package:json_annotation/json_annotation.dart';
import 'package:wordup/common/types.dart';
import '../../core/model/model.dart';

part 'sense.g.dart';

@JsonSerializable()
class Sense implements Model<UUID> {
  @override
  final UUID id;

  final String de;

  @JsonKey(name: 'do')
  final String doo;

  final String ty;

  final String ex;

  final String use;

  final String sy;

  final String op;

  final String re;

  final String tp;

  final List<String> cl;

  Sense({
    required this.id,
    required this.de,
    this.doo = '',
    required this.ty,
    required this.ex,
    required this.use,
    this.sy = '',
    this.op = '',
    this.re = '',
    this.tp = '',
    this.cl = const [],
  });

  static const fromJson = _$SenseFromJson;

  @override
  JSON toJson() => _$SenseToJson(this);
}
