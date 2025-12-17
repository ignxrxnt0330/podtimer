import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:podtimer/config/router/router.dart';
import 'package:podtimer/config/theme/theme.dart';
import 'package:podtimer/l10n/app_localizations.dart';
import 'package:podtimer/l10n/misc/loading_messages/loading_messages_localizations.dart';
import 'package:podtimer/presentation/blocs/blocs.dart';
import 'package:podtimer/presentation/views/views.dart';

final GlobalKey<_MainAppState> mainAppKey = GlobalKey<_MainAppState>();

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(MainApp(key: mainAppKey));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<Widget> pages = [
    HomeView(),
    SearchView(),
    FollowingView(),
    ProfileView(),
  ];

  final bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
        BlocProvider<ConfigBloc>(create: (context) => ConfigBloc()),
        BlocProvider<FollowingBloc>(create: (context) => FollowingBloc()),
      ],
      child: MaterialApp.router(
        theme: AppTheme.getTheme(context),
        locale: Locale('en'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          LoadingMessagesLocalizations.delegate,
        ],
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
