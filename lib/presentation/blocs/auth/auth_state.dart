part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final String token;
  const AuthState({this.token = ''});

  AuthState copyWith({String? token}) {
    return AuthState(token: token ?? this.token);
  }

  @override
  List<Object> get props => [token];
}
