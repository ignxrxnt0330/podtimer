import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podtimer/presentation/blocs/blocs.dart';

class Theme {
  ThemeData getTheme(BuildContext context) {
    var bloc = context.watch<ConfigBloc>();

    return ThemeData(
      useMaterial3: true,
      splashFactory: NoSplash.splashFactory,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: bloc.state.darkMode ? Brightness.dark : Brightness.light,
        surface: bloc.state.darkMode ? Colors.black : Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: bloc.state.darkMode ? Colors.black : Colors.white,
        foregroundColor: bloc.state.darkMode ? Colors.white : Colors.black,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: bloc.state.darkMode ? Colors.black : Colors.white,
        selectedItemColor: bloc.state.darkMode ? Colors.white : Colors.black,
        unselectedItemColor: bloc.state.darkMode ? Colors.white : Colors.black,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: bloc.state.darkMode ? Colors.white : Colors.black,
        selectedColor: bloc.state.darkMode ? Colors.white : Colors.black,
        textColor: bloc.state.darkMode ? Colors.white : Colors.black,
        selectedTileColor: bloc.state.darkMode ? Colors.black : Colors.white,
      ),
    );
  }
}
