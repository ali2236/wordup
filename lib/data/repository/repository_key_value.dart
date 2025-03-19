import 'package:wordup/core/datasource/data_source.dart';
import 'package:wordup/data/model/key_value.dart';

class KeyValueRepository {
  final DataSource<KeyValue, String, void> _dataSource;

  KeyValueRepository(this._dataSource);

  Future<void> put(String key, String value){
    return _dataSource.update(KeyValue(key, value));
  }

  String? get(String key, [String? defaultValue]) {
     final kv = _dataSource.get(key);
     return kv?.value ?? defaultValue;
  }

}