import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

class UserSimplePreferences {
  static late SharedPreferences _preferences;

  static const _keyThemeMode = 'themeMode';

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setTheme(ThemeMode themeMode) async => await _preferences.setString(_keyThemeMode, themeMode.toString());

  static getTheme() => _preferences.getString(_keyThemeMode);
}
