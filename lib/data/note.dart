import 'package:flutter/material.dart';

class Note {
  final int noteIndex;
  final String noteTitle;
  final String noteDescription;
  final Color noteColor;
  final DateTime createdTime;

  Note({required this.noteIndex, required this.noteTitle, required this.noteDescription, required this.noteColor, required this.createdTime});
}
