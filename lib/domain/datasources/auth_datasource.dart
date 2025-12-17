import 'package:podtimer/domain/entities/token_response.dart';

abstract class AuthDatasource {
  Future<void> login();
  Future<TokenResponse?> handleLogin(String code);
  String generateRandomString(int length);
}
