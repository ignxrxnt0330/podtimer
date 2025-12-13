import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:podtimer/l10n/app_localizations.dart';
import 'package:podtimer/l10n/misc/loading_messages/loading_messages_localizations.dart';
import 'package:podtimer/presentation/blocs/auth/auth_bloc.dart';
import 'package:podtimer/presentation/screens/screens.dart';
import 'package:routerino/routerino.dart';

Future main() async{
  await dotenv.load(fileName: ".env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
    providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(),
          ),
    ],
      child: MaterialApp(
        locale: Locale('en'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          LoadingMessagesLocalizations.delegate
      
        ],
        navigatorKey: Routerino.navigatorKey,
        home: RouterinoHome(builder: () => SplashScreen()),
        debugShowCheckedModeBanner: false
      ),
    );
  }
}
