import 'package:evently/core/cach_constants/cach_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late SharedPreferences prefs;
  static Future<void> get init async {
    prefs = await SharedPreferences.getInstance();
  }

  static void saveTheme(ThemeMode themeMode) {
    String currentTheme = themeMode == ThemeMode.light ? "Light" : "Dark";
    prefs.setString(CachConstants.themeKey, currentTheme);
  }

  static ThemeMode? get getSavedTheme {
    String? savedTheme = prefs.getString(CachConstants.themeKey);
    if (savedTheme == null) {
      return null;
    } else {
      return savedTheme == "Light" ? ThemeMode.light : ThemeMode.dark;
    }
  }

  static void saveLanguage(Locale language) {
    String currentLanguage = language == Locale("en") ? "en" : "ar";
    prefs.setString(CachConstants.languageKey, currentLanguage);
  }

  static Locale? get getSavedLanguage {
    String? savedLanguage = prefs.getString(CachConstants.languageKey);
    if (savedLanguage == null) {
      return null;
    } else {
      return savedLanguage == "en" ? Locale("en") : Locale("ar");
    }
  }
}
