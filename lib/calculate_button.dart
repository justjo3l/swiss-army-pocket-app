import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  CalculateButton({
    required this.buttonText,
  });
  String buttonText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 30),
      ),
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            Size(MediaQuery.of(context).size.width * 1 / 3, 100),
          ),
          side: MaterialStateProperty.all(BorderSide(
            style: BorderStyle.solid,
            color: Colors.black,
          ))),
    );
  }
}
