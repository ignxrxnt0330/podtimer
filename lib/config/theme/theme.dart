import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podtimer/main.dart';
import 'package:podtimer/presentation/blocs/blocs.dart';

class AppTheme {
  static ThemeData getTheme(BuildContext context) {
    bool darkMode = mainAppKey.currentState!.darkMode;
    return ThemeData(
      useMaterial3: true,
      splashFactory: NoSplash.splashFactory,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: darkMode ? Brightness.dark : Brightness.light,
        surface: darkMode ? Colors.black : Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: darkMode ? Colors.black : Colors.white,
        foregroundColor: darkMode ? Colors.white : Colors.black,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkMode ? Colors.black : Colors.white,
        selectedItemColor: darkMode ? Colors.white : Colors.black,
        unselectedItemColor: darkMode ? Colors.white : Colors.black,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: darkMode ? Colors.white : Colors.black,
        selectedColor: darkMode ? Colors.white : Colors.black,
        textColor: darkMode ? Colors.white : Colors.black,
        selectedTileColor: darkMode ? Colors.black : Colors.white,
      ),
      iconTheme: IconThemeData(color: darkMode ? Colors.white : Colors.black),
    );
  }
}
