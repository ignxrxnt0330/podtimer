class LoginResponse {
  String accessToken;
  String tokenType;
  String scope;
  String expiresIn;
  String refreshToken;

  LoginResponse({
      required this.accessToken,
      required this.tokenType,
      required this.scope,
      required this.expiresIn,
      required this.refreshToken,
      });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        accessToken: json['access_token'],
        tokenType: json['token_type'],
        scope: json['scope'],
        expiresIn: json['expires_in'].toString(),
        refreshToken: json['refresh_token'],
        );
  }

  @override
  String toString() {
    return 'LoginResponse{accessToken: $accessToken, tokenType: $tokenType, scope: $scope, expiresIn: $expiresIn, refreshToken: $refreshToken}';
  }
}
