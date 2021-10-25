// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';

import '../widgets/home_app_bar.dart';
import '../widgets/main_navigation_row.dart';

import 'notes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
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
