import 'package:flutter/material.dart';
import 'package:provider_test/utils/user_preferences.dart';

class DarkThemeProvider with ChangeNotifier {
  UserPreferences darkThemePreference = UserPreferences();
  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  setDarkThemeMode(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
