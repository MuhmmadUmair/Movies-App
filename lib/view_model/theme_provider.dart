import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeMode = MyThemeData.lightTheme;
  ThemeData get themeData => _themeMode;
  final String themeKey = "darktheme";
  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _themeMode = _themeMode == MyThemeData.darkTheme
        ? MyThemeData.lightTheme
        : MyThemeData.darkTheme;

    await prefs.setBool(themeKey, _themeMode == MyThemeData.darkTheme);
    notifyListeners();
  }
}
