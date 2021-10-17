// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, annotate_overrides

import 'package:flutter/material.dart';

class MainNavigationRow extends StatelessWidget {
  void _notesFunction() {
    print('Notes function');
  }

  void _centerFunction() {
    print('Center function');
  }

  void _calculateFunction() {
    print('Calculate function');
  }

  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          //NOTES BUTTON
          ElevatedButton(
            onPressed: _notesFunction,
            child: Icon(
              Icons.notes_rounded,
              size: 70,
            ),
            style: ButtonStyle(
              alignment: Alignment.centerLeft,
              minimumSize: MaterialStateProperty.all(Size(80, 250)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.zero,
                    bottomLeft: Radius.zero,
                  ),
                ),
              ),
            ),
          ),
          //CENTER BUTTON
          ElevatedButton(
            onPressed: _centerFunction,
            child: Icon(
              Icons.circle,
              size: 70,
            ),
            style: ButtonStyle(
              alignment: Alignment.centerLeft,
              minimumSize: MaterialStateProperty.all(Size(100, 150)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
            ),
          ),
          //CALCULATE BUTTON
          ElevatedButton(
            onPressed: _calculateFunction,
            child: Icon(
              Icons.calculate_rounded,
              size: 70,
            ),
            style: ButtonStyle(
              alignment: Alignment.centerRight,
              minimumSize: MaterialStateProperty.all(Size(80, 250)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.zero,
                    bottomRight: Radius.zero,
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
