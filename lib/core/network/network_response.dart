import 'dart:typed_data';

class NetworkResponse {
  final int statusCode;
  final Map<String, String> headers;
  final Uint8List bodyBytes;
  final String Function() decodeBody;

  String get body => decodeBody();

  NetworkResponse({
    required this.statusCode,
    required this.bodyBytes,
    required this.headers,
    required this.decodeBody,
  });

  bool get successful => statusCode >= 200 && statusCode < 300;
}
