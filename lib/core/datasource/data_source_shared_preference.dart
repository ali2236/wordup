import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordup/core/core.dart';
import 'package:wordup/core/datasource/data_source.dart';

import '../../common/types.dart';

class SharedPreferenceDataSource<M extends Model, ID, F>
    extends DataSource<M, ID, F> {
  final String prefix;
  final M Function(JSON json) fromJson;
  final SharedPreferences _prefs;

  SharedPreferenceDataSource(
    this._prefs, {
    this.prefix = 'default',
    required this.fromJson,
  });

  String _getKey(ID id) {
    return '$prefix.$id';
  }

  @override
  Future<void> create(M model) async {
    await _prefs.setString(_getKey(model.id), jsonEncode(model.toJson()));
  }

  @override
  Future<void> delete(ID id) async {
    await _prefs.remove(_getKey(id));
  }

  @override
  M? get(ID id) {
    final value = _prefs.getString(_getKey(id));
    if (value == null) return null;
    return fromJson(jsonDecode(value));
  }

  @override
  Stream<List<M>> getAll(F? filter) async* {}

  @override
  Future<void> update(M model) {
    return create(model);
  }
}
