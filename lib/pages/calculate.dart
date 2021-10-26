// ignore_for_file: unused_import, prefer_const_constructors, unused_local_variable, prefer_const_declarations,prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../widgets/calculate_app_bar.dart';
import '../widgets/main_navigation_row.dart';

import '../widgets/calculate_button.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({Key? key}) : super(key: key);

  @override
  CalculateScreenState createState() => CalculateScreenState();
}

class CalculateScreenState extends State<CalculateScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: CalculateAppBar(
          titleText: 'Calculate',
          titleIcon: Icon(Icons.calculate),
        ),
      ),
    );
  }
}
