import 'package:podtimer/domain/datasources/request_datasource.dart';
import 'package:podtimer/domain/repositories/request_repository.dart';

class RequestRepositoryImpl implements RequestRepository {
  final RequestDatasource datasource;
  RequestRepositoryImpl(this.datasource);

  @override
  Future<Map<String, dynamic>> makeRequest(
    String url,
    String method,
    Map<String, String> headers,
    Map<String, dynamic>? body,
  ) {
    return datasource.makeRequest(
      url: url,
      method: method,
      headers: headers,
      body: body,
    );
  }

  @override
  Future<bool> refreshToken() {
    return datasource.refreshToken();
  }
}
