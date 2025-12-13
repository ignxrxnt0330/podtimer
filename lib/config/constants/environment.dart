import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String clientId = dotenv.env["spotify.client.id"] ?? "";
  static String clienSecret = dotenv.env["spotify.client.secret"] ?? "";
}
