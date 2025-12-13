import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podtimer/presentation/blocs/auth/auth_bloc.dart';
import 'package:podtimer/presentation/screens/home_screen.dart';
import 'package:podtimer/presentation/screens/login_screen.dart';
import 'package:podtimer/presentation/widgets/shared.dart';
import 'package:routerino/routerino.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();



}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(GetCachedToken());
    context.read<AuthBloc>().stream.listen((state) {
      if (state.token.isNotEmpty) {
        if (!context.mounted) return;
        context.push(() => HomeScreen());
      } else {
        if (!context.mounted) return;
        debugPrint('not loggedin');
        context.push(() => LoginScreen());
      }
    });
    return const FullScreenLoader();
  }
}
