import 'package:wordup/core/network/network_response.dart';

abstract class NetworkClient {
  final Uri basePath;

  const NetworkClient({required this.basePath});

  Future<NetworkResponse> get({
    String path = '',
    Map<String, dynamic>? queryParam,
    Uri? basePath,
  });
}
