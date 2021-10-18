// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';

import './home_app_bar.dart';
import './main_navigation_row.dart';

import './notes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(
          titleText: 'Swiss Army Pocket App',
          titleIcon: Icon(Icons.fireplace),
        ),
        body: MainNavigationRow(),
        backgroundColor: Theme.of(context).canvasColor);
  }
}

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  final mainThemeColorHex = 0xFFC62628;

  final Map<int, Color> mainThemeColor = {
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

  final secondaryThemeColorHex = 0xFFE0D3D3;

  final Map<int, Color> secondaryThemeColor = {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swiss Army Pocket App',
      home: HomeScreen(),
      theme: ThemeData(
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
      ),
    );
  }
}

void main() {
  runApp(MainApp());
}
