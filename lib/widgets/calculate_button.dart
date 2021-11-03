// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../pages/calculate.dart';

class CalculateButton extends StatelessWidget {
  CalculateButton({
    required this.buttonText,
    this.borderRadius,
  });

  String buttonText;
  double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius == null ? 5.0 : borderRadius as double),
              side: BorderSide(
                width: 0.3,
                style: BorderStyle.solid,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
          padding: MaterialStateProperty.all(EdgeInsets.all(15.0)),
        ),
        onPressed: () {
          CalculateScreen.of(context).buttonPressed(buttonText);
        },
        child: FittedBox(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 30.0,
              color: Theme.of(context).primaryTextTheme.headline6!.color,
            ),
          ),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
