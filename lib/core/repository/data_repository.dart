import 'package:wordup/core/model/model.dart';
import 'package:wordup/core/repository/repository.dart';

import '../datasource/data_source.dart';

abstract class DataRepository<M extends Model, ID, Filter>
    extends Repository<M, ID, Filter> {
  final DataSource<M, ID, Filter> dataSource;

  const DataRepository(this.dataSource);

  @override
  Stream<M> get(ID id) {
    return dataSource.getStreaming(id);
  }

  @override
  Stream<List<M>> getAll(Filter? filter) {
    return dataSource.getAll(filter);
  }

  @override
  Future<void> update(ID id, M? model) {
    if (model == null) {
      return dataSource.delete(id);
    } else {
      return dataSource.update(model);
    }
  }

  @override
  Future<void> add(M model) {
    return dataSource.create(model);
  }
}