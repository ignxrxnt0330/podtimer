part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class SaveToken extends AuthEvent {
  final String token;
  const SaveToken(this.token);
}

class DeleteToken extends AuthEvent {
  const DeleteToken();
}

class GetCachedToken extends AuthEvent {
  const GetCachedToken();
}

class NotLoggedIn extends AuthEvent {
  const NotLoggedIn();
}

class Login extends AuthEvent {
  const Login();
}

class LoginAccepted extends AuthEvent {
  final String code;
  const LoginAccepted(this.code);
}
