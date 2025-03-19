import 'dart:convert';
import 'dart:math';

import 'package:wordup/common/types.dart';
import 'package:wordup/common/uris.dart';
import 'package:wordup/core/core.dart';
import 'package:wordup/core/datasource/data_source_network.dart';
import 'package:wordup/data/filters/filter_query_string.dart';
import '../model/word_info_minimal.dart';

class RemoteWordInfoMinimalDataSource
    extends NetworkDataSource<MinimalWordInfo, int, StringQueryFilter> {
  RemoteWordInfoMinimalDataSource(super.client);

  @override
  Stream<List<MinimalWordInfo>> getAll(StringQueryFilter? filter) async* {
    if (filter == null) {
      yield* Stream.value([]);
    } else {
      final response = await client.get(
        basePath: wordUpDefine,
        path: '/byText/${filter.query}',
      );
      if (response.successful) {
        final bodyString = response.body;
        final json = jsonDecode(bodyString) as List<dynamic>;
        yield json
            .cast<Map<String, dynamic>>()
            .map<MinimalWordInfo>(_mapFromDefine)
            .toList();
      } else {
        yield* Stream.error('Status Code ${response.statusCode}');
      }
    }
  }

  MinimalWordInfo _mapFromDefine(JSON it) {
    final word = it.entries.first.key;
    final props = it[word] as Map<String, dynamic>;
    final phonetics = (props['phonemic'] as String).split("|");
    return MinimalWordInfo(
      id: props['id'],
      rank: Random().nextInt(998) + 1,
      text: props['wordRoot'],
      otherForms: props['wordForms'].cast<String>(),
      primarySenseId: props['bigId'],
      britishPhonetic: phonetics.first,
      americanPhonetic: phonetics.last,
    );
  }
}
