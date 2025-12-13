import 'package:dio/dio.dart';
import 'package:podtimer/config/constants/environment.dart';
import 'package:podtimer/domain/datasources/auth_datasource.dart';

class SpotifyAuthDatasource extends AuthDatasource {

  @override
    Future<String> login() async {
      final res = await Dio(BaseOptions(
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
            )).post(
            "https://accounts.spotify.com/api/token",
            queryParameters: {"client_id": Environment.clientId, "client_secret": Environment.clienSecret, "grant_type": "client_credentials"},
            );

      return res.data["access_token"];
    }

}
