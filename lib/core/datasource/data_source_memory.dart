import 'dart:collection';
import '../model/model.dart';
import 'data_source.dart';

class MemoryDataSource<M extends Model, ID, Filter> extends DataSource<M, ID, Filter> {

  final _data = <M>[];

  @override
  Future<void> create(M model) async {
    _data.add(model);
  }

  @override
  Future<void> delete(ID id) async {
    _data.removeWhere((it)=>it.id == id);
  }

  @override
  M? get(ID id) {
    final d = _data.where((it) => it.id == id).firstOrNull;
    return d;
  }

  @override
  Future<void> update(M model) async {
    _data.removeWhere((it) => it.id == model.id);
    _data.add(model);
  }

  @override
  Stream<List<M>> getAll(Filter? filter) {
    return Stream.value(UnmodifiableListView(_data));
  }

}