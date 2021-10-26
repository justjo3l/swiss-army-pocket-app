// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../pages/calculate.dart';

class CalculateButton extends StatelessWidget {
  CalculateButton({
    required this.buttonText,
  });

  String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: Theme.of(context).primaryColor,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
          ),
          padding: MaterialStateProperty.all(EdgeInsets.all(15.0)),
        ),
        onPressed: () {
          CalculateScreen.of(context).buttonPressed(buttonText);
        },
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 32.0,
            color: Theme.of(context).primaryTextTheme.headline6!.color,
          ),
        ),
      ),
    );
  }
}
