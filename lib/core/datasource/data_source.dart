import 'package:wordup/core/model/model.dart';

abstract class DataSource<M extends Model, ID, Filter> {
  Future<void> create(M model);
  Future<void> delete(ID id);
  Future<void> update(M model);
  M? get(ID id) => throw UnimplementedError();
  Stream<List<M>> getAll(Filter? filter);
  Stream<M> getStreaming(ID id) async* {
    final value = get(id);
    if (value != null) {
      yield value;
    }
  }

  const DataSource();
}
