// ignore_for_file: prefer_const_declarations, prefer_const_constructors

import 'package:flutter/material.dart';

class AppTheme {
  static final mainThemeColorHex = 0xFFC62628;

  static final Map<int, Color> mainThemeColor = {
    50: Color.fromRGBO(169, 20, 20, .1),
    100: Color.fromRGBO(169, 20, 20, .2),
    200: Color.fromRGBO(169, 20, 20, .3),
    300: Color.fromRGBO(169, 20, 20, .4),
    400: Color.fromRGBO(169, 20, 20, .5),
    500: Color.fromRGBO(169, 20, 20, .6),
    600: Color.fromRGBO(169, 20, 20, .7),
    700: Color.fromRGBO(169, 20, 20, .8),
    800: Color.fromRGBO(169, 20, 20, .9),
    900: Color.fromRGBO(169, 20, 20, 1),
  };

  static final secondaryThemeColorHex = 0xFFE0D3D3;

  static final Map<int, Color> secondaryThemeColor = {
    50: Color.fromRGBO(224, 211, 211, .1),
    100: Color.fromRGBO(224, 211, 211, .2),
    200: Color.fromRGBO(224, 211, 211, .3),
    300: Color.fromRGBO(224, 211, 211, .4),
    400: Color.fromRGBO(224, 211, 211, .5),
    500: Color.fromRGBO(224, 211, 211, .6),
    600: Color.fromRGBO(224, 211, 211, .7),
    700: Color.fromRGBO(224, 211, 211, .8),
    800: Color.fromRGBO(224, 211, 211, .9),
    900: Color.fromRGBO(224, 211, 211, 1),
  };

  static ThemeData getAppTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: MaterialColor(mainThemeColorHex, mainThemeColor),
      canvasColor: MaterialColor(secondaryThemeColorHex, secondaryThemeColor),
      primaryIconTheme: IconThemeData(
        color: Colors.white,
      ),
      primaryTextTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(),
        buttonColor: MaterialColor(mainThemeColorHex, mainThemeColor),
      ),
    );
  }
}
