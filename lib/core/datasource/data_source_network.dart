import 'package:wordup/core/core.dart';
import 'package:wordup/core/network/network_client.dart';
import 'data_source.dart';

abstract class NetworkDataSource<M extends Model, ID, Filter> extends DataSource<M, ID, Filter>{
  final NetworkClient client;

  NetworkDataSource(this.client);

  @override
  Future<void> create(M model) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(ID id) {
    throw UnimplementedError();
  }

  @override
  Stream<M> getStreaming(ID id) {
    throw UnimplementedError();
  }

  @override
  Stream<List<M>> getAll(Filter? filter) {
    throw UnimplementedError();
  }

  @override
  Future<void> update(M model) {
    throw UnimplementedError();
  }

}