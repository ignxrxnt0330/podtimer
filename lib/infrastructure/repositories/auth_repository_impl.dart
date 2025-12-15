import 'package:podtimer/domain/entities/login_response.dart';
import 'package:podtimer/domain/repositories/auth_repository.dart';
import 'package:podtimer/infrastructure/datasources/spotify_auth_datasource.dart';
import 'package:podtimer/infrastructure/datasources/sp_cache_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SpotifyAuthDatasource authDatasource;
  final SpCacheDatasource cacheDataSource;
  AuthRepositoryImpl(this.authDatasource, this.cacheDataSource);

  @override
  Future<LoginResponse?> login() {
    return authDatasource.login();
  }

  @override
  String generateRandomString(int length) {
    return authDatasource.generateRandomString(length);
  }
}
