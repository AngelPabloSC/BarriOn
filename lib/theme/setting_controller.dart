import 'package:flutter/material.dart';

class SettingController with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleThemeMode() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }


  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}