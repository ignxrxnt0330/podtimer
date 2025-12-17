import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podtimer/presentation/blocs/auth/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: [
            const Text(
              "It looks like you are not logged in",
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              "Do it so we can give you a more personalized experience.",
            ),
            TextButton(
              child: const Text("Log in"),
              onPressed: () {
                context.read<AuthBloc>().add(Login());
              },
            ),
          ],
        ),
      ),
    );
  }
}
