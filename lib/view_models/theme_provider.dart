import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movie_app/Enums/theme_enum.dart';

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeEnum>(
  (ref) => ThemeProvider(),
);

class ThemeProvider extends StateNotifier<ThemeEnum> {
  static const prefsKey = "isDarkMode";

  ThemeProvider() : super(ThemeEnum.light) {
    _init();
  }

  Future<void> _init() async {
    // Load theme in background
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(prefsKey) ?? false;

    // Update state AFTER async load
    state = isDark ? ThemeEnum.dark : ThemeEnum.light;
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final newState = state == ThemeEnum.dark ? ThemeEnum.light : ThemeEnum.dark;

    // Update state first for instant UI response
    state = newState;

    // Save in background (no UI delay)
    unawaited(prefs.setBool(prefsKey, newState == ThemeEnum.dark));
  }
}
