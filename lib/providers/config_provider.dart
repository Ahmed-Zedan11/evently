import 'package:evently/core/prefs_manager/prefs_manager.dart';
import 'package:flutter/material.dart';

class ConfigProvider extends ChangeNotifier {
  ThemeMode currentTheme = PrefsManager.getSavedTheme ?? ThemeMode.light;
  Locale currentLanguage = PrefsManager.getSavedLanguage ?? Locale("en");

  void changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    PrefsManager.saveTheme(currentTheme);
    notifyListeners();
  }

  void get toggleTheme {
    currentTheme == ThemeMode.light
        ? currentTheme = ThemeMode.dark
        : currentTheme = ThemeMode.light;
    PrefsManager.saveTheme(currentTheme);

    notifyListeners();
  }

  void changeLanguage(Locale newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    PrefsManager.saveLanguage(currentLanguage);

    notifyListeners();
  }

  void get toggleLanguage {
    currentLanguage == Locale("en")
        ? currentLanguage = Locale("ar")
        : currentLanguage = Locale("en");
    PrefsManager.saveLanguage(currentLanguage);

    notifyListeners();
  }
}
