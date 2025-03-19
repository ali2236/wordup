import 'package:wordup/common/types.dart';

abstract class Model<K> {
  K get id;
  JSON toJson();
}