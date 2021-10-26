// ignore_for_file: unused_import, prefer_const_constructors, unused_local_variable, prefer_const_declarations,prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../widgets/calculate_app_bar.dart';
import '../widgets/main_navigation_row.dart';

import '../widgets/calculate_button.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({Key? key}) : super(key: key);

  @override
  CalculateScreenState createState() => CalculateScreenState();

  static CalculateScreenState of(BuildContext context) => context.findAncestorStateOfType<CalculateScreenState>() as CalculateScreenState;
}

class CalculateScreenState extends State<CalculateScreen> {
  String equation = '0';
  String result = '';
  String expression = '0';
  double equationFontSize = 48.0;
  double resultFontSize = 48.0;

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        equation = '0';
        result = '';
        equationFontSize = 48.0;
        resultFontSize = 38.0;
      } else if (buttonText == '<') {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = '0';
        }
      } else if (buttonText == '=') {
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('/', '/');
        if (equation.startsWith('0')) {
          equation = equation.substring(equation.lastIndexOf('0') + 1, equation.length);
        }
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'Error';
        }
      } else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == '0') {
          equation = '';
        }
        equation = equation + buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: CalculateAppBar(
          titleText: 'Calculate',
          titleIcon: Icon(Icons.calculate),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                equation,
                style: TextStyle(fontSize: equationFontSize),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                result,
                style: TextStyle(fontSize: resultFontSize),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          CalculateButton(
                            buttonText: 'C',
                          ),
                          CalculateButton(
                            buttonText: '<',
                          ),
                          CalculateButton(
                            buttonText: '/',
                          ),
                        ],
                      ),
                      TableRow(
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
                      TableRow(
                        children: [
                          CalculateButton(
                            buttonText: '4',
                          ),
                          CalculateButton(
                            buttonText: '5',
                          ),
                          CalculateButton(
                            buttonText: '6',
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CalculateButton(
                            buttonText: '1',
                          ),
                          CalculateButton(
                            buttonText: '2',
                          ),
                          CalculateButton(
                            buttonText: '3',
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CalculateButton(
                            buttonText: '.',
                          ),
                          CalculateButton(
                            buttonText: '0',
                          ),
                          CalculateButton(
                            buttonText: '00',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          CalculateButton(
                            buttonText: '*',
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CalculateButton(
                            buttonText: '-',
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CalculateButton(
                            buttonText: '+',
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CalculateButton(
                            buttonText: '/',
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CalculateButton(
                            buttonText: '=',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      onPanUpdate: (gestureDetails) {
        if (gestureDetails.delta.dy > 5) {
          Navigator.of(context).pop();
        }
      },
    );
  }
}
