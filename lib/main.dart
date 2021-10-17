// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: Theme.of(context).primaryIconTheme,
        titleTextStyle: Theme.of(context).primaryTextTheme.headline6,
        actionsIconTheme: Theme.of(context).primaryIconTheme,
        leading: Icon(Icons.fireplace),
        title: const Text(
          'Swiss Army Pocket App',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigation),
            onPressed: null,
          ),
        ],
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swiss Army Pocket App',
      home: HomeScreen(),
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: MaterialColor(mainThemeColorHex, mainThemeColor),
          primaryIconTheme: IconThemeData(
            color: Colors.white,
          ),
          primaryTextTheme: TextTheme(
              headline6: TextStyle(
            color: Colors.white,
          ))),
    );
  }
}

void main() {
  runApp(MainApp());
}
