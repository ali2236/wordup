import 'dart:typed_data';

import 'package:gzip/gzip.dart';

Future<List<int>> decodeGzip(Uint8List data) async {
  final gz = GZip();
  return await gz.decompress(data);
}
