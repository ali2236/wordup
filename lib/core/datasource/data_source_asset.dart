import 'package:flutter/services.dart';
import 'package:wordup/core/datasource/data_source.dart';
import 'package:wordup/core/model/model.dart';

class AssetDataSource<M extends Model, ID, Filter> extends DataSource<M, ID, Filter> {
  final String assetPath;

  AssetDataSource(this.assetPath);

  Future<String> load() async {
    try {
      return await rootBundle.loadString(assetPath);
    } catch (e) {
      throw Exception('Failed to load asset: $assetPath\nError: $e');
    }
  }

  @override
  Future<void> create(M model) => throw UnimplementedError();

  @override
  Future<void> delete(ID id) => throw UnimplementedError();

  @override
  Future<void> update(M model) => throw UnimplementedError();

  @override
  M? get(ID id) => throw UnimplementedError();

  @override
  Stream<List<M>> getAll(Filter? filter) => throw UnimplementedError();
} 