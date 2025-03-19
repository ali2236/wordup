import 'package:wordup/core/model/model.dart';

abstract class Repository<M extends Model, ID, Filter> {
  Future<void> update(ID id, M? model) =>
      throw UnimplementedError(); // create - update - delete
  Future<void> add(M model) => throw UnimplementedError();
  Stream<M> get(ID id);
  Stream<List<M>> getAll(Filter? filter) => throw UnimplementedError();

  const Repository();
}
