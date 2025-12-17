import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podtimer/l10n/app_localizations.dart';
import 'package:podtimer/presentation/blocs/auth/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Material(
      child: Center(
        child: Column(
          children: [
            Text(localizations.login, style: TextStyle(fontSize: 20),
            ),
            TextButton(
              child: Text(localizations.notLoggedIn),
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
