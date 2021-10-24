// ignore_for_file: unused_import, prefer_const_constructors, unused_local_variable, prefer_const_declarations,prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '/./calculate_app_bar.dart';
import '/./main_navigation_row.dart';

import '../calculate_button.dart';

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
        body: Form(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    CalculateButton(
                      buttonText: '7',
                    ),
                    CalculateButton(
                      buttonText: '8',
                    ),
                    CalculateButton(
                      buttonText: '9',
                    ),
                  ],
                ),
                Row(
                  children: [
                    CalculateButton(
                      buttonText: '6',
                    ),
                    CalculateButton(
                      buttonText: '5',
                    ),
                    CalculateButton(
                      buttonText: '4',
                    ),
                  ],
                ),
                Row(
                  children: [
                    CalculateButton(
                      buttonText: '3',
                    ),
                    CalculateButton(
                      buttonText: '2',
                    ),
                    CalculateButton(
                      buttonText: '1',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
