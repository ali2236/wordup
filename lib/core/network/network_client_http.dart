import 'package:wordup/core/network/network_client.dart';
import 'package:wordup/core/network/network_response.dart';
import 'package:http/http.dart' as http;

class HttpNetworkClient extends NetworkClient {
  final http.Client _client = http.Client();

  HttpNetworkClient({required super.basePath});

  @override
  Future<NetworkResponse> get({
    String path = '',
    Map<String, dynamic>? queryParam,
    Uri? basePath,
  }) async {
    final reqUri = (basePath ?? this.basePath).resolve(path);
    final response = await _client.get(reqUri);

    return NetworkResponse(
      statusCode: response.statusCode,
      bodyBytes: response.bodyBytes,
      headers: response.headers,
      decodeBody: () => response.body,
    );
  }
}
