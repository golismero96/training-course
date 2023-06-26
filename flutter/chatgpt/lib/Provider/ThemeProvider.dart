import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {

  ThemeMode _themeMode = ThemeMode.light;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

}