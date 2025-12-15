import 'dart:convert';
import 'dart:math';

import 'package:app_links/app_links.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:podtimer/config/constants/environment.dart';
import 'package:podtimer/domain/datasources/auth_datasource.dart';
import 'package:podtimer/domain/entities/login_response.dart';
import 'package:url_launcher/url_launcher.dart';

class SpotifyAuthDatasource extends AuthDatasource {
  String codeVerifier = "";

  @override
    Future<LoginResponse?> login() async {
      codeVerifier = generateRandomString(64);

      final hashed = sha256.convert(utf8.encode(codeVerifier)).bytes;
      final String codeChallenge = base64Encode(hashed)
        .replaceAll('=', '')
        .replaceAll('+', '-')
        .replaceAll('/', '_');

      final uri = Uri.https('accounts.spotify.com', '/authorize', {
          "response_type": "code",
          "client_id": Environment.clientId, 
          "scope": Environment.scope, 
          "code_challenge_method": "S256",
          "code_challenge": codeChallenge,
          "redirect_uri": Environment.redirectUri
          });

      await launchUrl(uri, mode: LaunchMode.externalApplication);
      final appLinks = AppLinks();
      
      final uriWithCode = await appLinks.uriLinkStream
          .firstWhere((uri) => uri.queryParameters.containsKey('code'));

      final authCode = uriWithCode.queryParameters['code']!;
      final loginResponse = await exchangeCodeForToken(authCode);

      return loginResponse;
    }


  Future<LoginResponse?> exchangeCodeForToken(String code) async {
    final verifier = codeVerifier;

    final response = await http.post(
        Uri.parse('https://accounts.spotify.com/api/token'),
        headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        },
body: {
'client_id': Environment.clientId,
'grant_type': 'authorization_code',
'code': code,
'redirect_uri': Environment.redirectUri,
'code_verifier': verifier,
},
);

if (response.statusCode == 200) {
  LoginResponse loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
  return loginResponse;
}
return null;
}

@override
String generateRandomString(int length) {
  var r = Random();
  const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(length, (index) => chars[r.nextInt(chars.length)]).join();
}

}
