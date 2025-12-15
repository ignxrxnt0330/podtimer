import 'package:podtimer/domain/entities/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse?> login();
  String generateRandomString(int length);
}
