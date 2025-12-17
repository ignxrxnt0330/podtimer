import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:podtimer/presentation/blocs/blocs.dart';
import 'package:podtimer/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: "/login",
      name: "loginScreen",
      builder: (context, state) {
        return LoginScreen();
      },
      routes: const [],
    ),
    GoRoute(
      path: "/home/:page",
      name: "homeScreen",
      builder: (context, state) {
        final index = int.parse(state.pathParameters['page'] ?? "0");
        return HomeScreen(index: index);
      },
      routes: const [],
    ),
    GoRoute(
      path: "/podcast/:id",
      name: "podcastScreen",
      builder: (context, state) {
        return Placeholder();
      },
      routes: const [],
    ),
    GoRoute(
      path: "/splash",
      name: "splashScreen",
      builder: (context, state) {
        return SplashScreen();
      },
      routes: const [],
    ),
    GoRoute(
      path: "/callback/:code",
      name: "callbackScreen",
      builder: (context, state) {
        final code = state.pathParameters['code']?.replaceFirst('code=', '');
        if (code != null) {
          context.read<AuthBloc>().add(LoginAccepted(code));
        }
        return SplashScreen();
      },
      routes: const [],
    ),
  ],
  redirect: (context, state) {
    checkLoggedIn(context);
    final isLoggedIn = context.read<AuthBloc>().state.token.isNotEmpty;
    final isCallback = state.uri.toString().startsWith('podtimer://callback');

    if (isCallback) return '/callback/${state.uri.query}';

    if (!isLoggedIn) {
      return '/login';
    } else {
      return '/home/0';
    }
  }
);

void checkLoggedIn(BuildContext context) {
  context.read<AuthBloc>().add(GetCachedToken());
  context.read<AuthBloc>().stream.firstWhere((state) => state.token.isNotEmpty).then((value) {
      if (!context.mounted) return;
        context.go('/home/0');
      });
}
