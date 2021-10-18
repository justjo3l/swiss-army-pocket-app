// ignore_for_file: unused_import,prefer_const_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';

import './main.dart';
import './note_page.dart';

class NoteContainer extends StatelessWidget {
  final String noteName;
  final String noteData;

  void noteClick(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NotePageScreen(
          noteName: noteName,
          noteData: noteData,
        ),
      ),
    );
  }

  NoteContainer({
    required this.noteName,
    required this.noteData,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      child: GestureDetector(
        child: Container(
          child: Column(
            children: [
              Text(
                noteName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                noteData,
                style: TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          color: Colors.white,
          margin: EdgeInsets.only(
            top: 20.0,
            left: 5.0,
            right: 5.0,
          ),
          padding: EdgeInsets.all(5.0),
        ),
        onTap: () {
          noteClick(context);
        },
      ),
      tag: '$noteName',
    );
  }
}
