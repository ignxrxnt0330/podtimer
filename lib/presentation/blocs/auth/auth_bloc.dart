import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podtimer/infrastructure/datasources/sp_cache_datasource.dart';
import 'package:podtimer/infrastructure/datasources/spotify_auth_datasource.dart';
import 'package:podtimer/infrastructure/repositories/auth_repository_impl.dart';
import 'package:podtimer/infrastructure/repositories/cache_repository_impl.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final auth = AuthRepositoryImpl(SpotifyAuthDatasource(), SpCacheDatasource());
  final cache = CacheRepositoryImpl(SpCacheDatasource());

  AuthBloc() : super(const AuthState()) {
    on<GetCachedToken>((event, emit) async {
        String token = await cache.getCachedData('token') ?? '';
        emit(state.copyWith(token: token));

        on<Login>((event, emit) async {
            String token = await auth.login();
            if (token.isNotEmpty) {
              await cache.setCachedData('token', token);
              emit(state.copyWith(token: token));
            }
            });

        });

  }
}
