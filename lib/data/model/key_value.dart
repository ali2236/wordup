import 'package:json_annotation/json_annotation.dart';
import 'package:wordup/common/types.dart';
import 'package:wordup/core/core.dart';

part 'key_value.g.dart';

@JsonSerializable()
class KeyValue implements Model<String>{
  final String key;
  final String value;

  const KeyValue(this.key, this.value);

  static const fromJson = _$KeyValueFromJson;

  @override
  String get id => key;

  @override
  JSON toJson() => _$KeyValueToJson(this);
}