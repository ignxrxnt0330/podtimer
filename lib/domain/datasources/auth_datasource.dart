import 'package:podtimer/domain/entities/login_response.dart';

abstract class AuthDatasource {
  Future<LoginResponse?> login();
  String generateRandomString(int length);
}
