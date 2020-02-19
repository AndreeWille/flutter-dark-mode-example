import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode;
  ThemeMode defaultThemeMode = ThemeMode.system;

  ThemeManager() {
    _getThemeModeFromSharedPrefs();
  }

  get themeMode {
    return _themeMode;
  }

  set themeMode(ThemeMode themeMode)  {
    _themeMode = themeMode;
    _saveThemeModeInSharedPrefs(themeMode);
    notifyListeners();
  }

  void _getThemeModeFromSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeModeFromPrefs = prefs.getString('themeMode');

    _themeMode = ThemeMode.values.firstWhere(
      (element) => themeModeFromPrefs == element.toString(), 
      orElse: () => defaultThemeMode
    );
    notifyListeners();
  } 

  _saveThemeModeInSharedPrefs(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', themeMode.toString());
  }
}
