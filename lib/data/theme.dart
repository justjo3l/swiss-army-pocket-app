import 'package:flutter/material.dart';

class AppTheme {
  static const mainThemeColorHex = 0xFFC62628;

  static final Map<int, Color> mainThemeColor = {
    50: const Color.fromRGBO(169, 20, 20, .1),
    100: const Color.fromRGBO(169, 20, 20, .2),
    200: const Color.fromRGBO(169, 20, 20, .3),
    300: const Color.fromRGBO(169, 20, 20, .4),
    400: const Color.fromRGBO(169, 20, 20, .5),
    500: const Color.fromRGBO(169, 20, 20, .6),
    600: const Color.fromRGBO(169, 20, 20, .7),
    700: const Color.fromRGBO(169, 20, 20, .8),
    800: const Color.fromRGBO(169, 20, 20, .9),
    900: const Color.fromRGBO(169, 20, 20, 1),
  };

  static const secondaryThemeColorHex = 0xFFE0D3D3;

  static final Map<int, Color> secondaryThemeColor = {
    50: const Color.fromRGBO(224, 211, 211, .1),
    100: const Color.fromRGBO(224, 211, 211, .2),
    200: const Color.fromRGBO(224, 211, 211, .3),
    300: const Color.fromRGBO(224, 211, 211, .4),
    400: const Color.fromRGBO(224, 211, 211, .5),
    500: const Color.fromRGBO(224, 211, 211, .6),
    600: const Color.fromRGBO(224, 211, 211, .7),
    700: const Color.fromRGBO(224, 211, 211, .8),
    800: const Color.fromRGBO(224, 211, 211, .9),
    900: const Color.fromRGBO(224, 211, 211, 1),
  };

  static ThemeData getTheme({required bool isDark}) {
    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primarySwatch: isDark
          ? null
          : MaterialColor(
              mainThemeColorHex,
              mainThemeColor,
            ),
      canvasColor: isDark
          ? null
          : MaterialColor(
              secondaryThemeColorHex,
              secondaryThemeColor,
            ),
      cardColor: isDark ? Colors.grey[800] : Colors.white,
      primaryIconTheme: const IconThemeData(
        color: Colors.white,
      ),
      primaryTextTheme: TextTheme(
        headline6: const TextStyle(
          color: Colors.white,
        ),
        headline4: const TextStyle(
          color: Colors.black,
        ),
        headline5: TextStyle(
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      secondaryHeaderColor: isDark ? Colors.grey : Colors.white,
      buttonTheme: ButtonThemeData(
        shape: const RoundedRectangleBorder(),
        buttonColor: isDark ? Colors.grey : MaterialColor(mainThemeColorHex, mainThemeColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(),
            ),
            backgroundColor: MaterialStateProperty.all(
              isDark
                  ? Colors.grey[800]
                  : MaterialColor(
                      mainThemeColorHex,
                      mainThemeColor,
                    ),
            ),
            elevation: isDark ? MaterialStateProperty.all(10.0) : null),
      ),
    );
  }
}
