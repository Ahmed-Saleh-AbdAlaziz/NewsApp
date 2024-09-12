import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String appLanguage = "en";
  ThemeMode appThemeMode = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newMode) {
    if (appThemeMode == newMode) {
      return;
    }
    appThemeMode = newMode;
    notifyListeners();
  }

  bool isDarkMode() {
    return appThemeMode == ThemeMode.dark;
  }
}
