import 'dart:convert';

import 'package:wordup/common/uris.dart';
import 'package:wordup/core/core.dart';
import '../model/word.dart';

class RemoteWordDataSource extends NetworkDataSource<Word, int, void> {
  RemoteWordDataSource(super.client);

  @override
  Stream<Word> getStreaming(int id) async* {
    final response = await client.get(
      basePath: wordUpCDN,
      path: '/v2024-1-18/$id.gz',
    );
    if (response.successful) {
      final decodedGzip = await decodeGzip(response.bodyBytes);
      final bodyString = utf8.decode(decodedGzip);
      final json = jsonDecode(bodyString);
      final word = Word.fromJson(json);
      yield* Stream.value(word);
    } else {
      yield* Stream.error('Status Code: ${response.statusCode}');
    }
  }
}
