import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:podtimer/config/constants/environment.dart';
import 'package:podtimer/domain/datasources/request_datasource.dart';
import 'package:podtimer/domain/entities/token_response.dart';
import 'package:podtimer/infrastructure/datasources/sp_cache_datasource.dart';
import 'package:podtimer/infrastructure/repositories/cache_repository_impl.dart';

class SpotifyRequestDatasource implements RequestDatasource {
  final cache = CacheRepositoryImpl(SpCacheDatasource());

  @override
  Future<Map<String, dynamic>> makeRequest({
    String url = '',
    String method = 'GET',
    Map<String, String> headers = const {},
    Map<String, dynamic>? body,
  }) async {
    http.Response response;
    final Map<String, String> headers_ = Map<String, String>.from(headers);
    headers_.addAll({
      'Authorization': 'Bearer ${await cache.getCachedData("token")} }',
    });

    if (method == 'GET') {
      response = await http.get(Uri.parse(url), headers: headers_);
    } else if (method == 'POST') {
      response = await http.post(Uri.parse(url), headers: headers_, body: body);
    } else {
      throw UnsupportedError('HTTP method $method is not supported');
    }

    return handleResponse(response, url, method, headers, body);
  }

  Future<Map<String, dynamic>> handleResponse(
    http.Response response,
    url,
    method,
    headers,
    body,
  ) async {
    switch (response.statusCode) {
      case 200:
        print('Response body: ${response.body}');
        return Future.value(
          Map<String, dynamic>.from(
            response.body.isNotEmpty ? jsonDecode(response.body) : {},
          ),
        );
      case 401:
        await refreshToken();
        return makeRequest(url: url, method: method, headers: headers, body: body);
      default:
        return Future.error(
          'Request failed with status: ${response.statusCode}, body: ${response.body}',
        );
    }
  }

  @override
  Future<void> refreshToken() async {
    final response = await http.post(
      Uri.parse(Environment.tokenUrl),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'client_id': Environment.clientId,
        'grant_type': 'refresh_token',
        'refresh_token': await cache.getCachedData('refreshToken'),
      },
    );
    print(response.statusCode);
    print(response.body);
    print(response.reasonPhrase);
    if (response.statusCode == 200) {
      final token = TokenResponse.fromJson(jsonDecode(response.body)).accessToken;
      print('New token: $token');
      cache.setCachedData('token', token);
    }
  }
}
