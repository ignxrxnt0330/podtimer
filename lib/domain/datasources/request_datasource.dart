abstract class RequestDatasource {
  Future<Map<String, dynamic>> makeRequest({
    String url,
    String method,
    Map<String, String> headers,
    Map<String, dynamic>? body,
  });
  Future<bool> refreshToken();
}
