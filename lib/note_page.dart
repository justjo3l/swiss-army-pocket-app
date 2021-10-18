// ignore_for_file: type_init_formals, no_logic_in_create_state, prefer_const_constructors

import 'package:flutter/material.dart';

class NotePageScreen extends StatefulWidget {
  final String noteName;
  final String noteData;

  const NotePageScreen({Key? key, required String this.noteName, required String this.noteData}) : super(key: key);

  @override
  _NotePageScreenState createState() => _NotePageScreenState(
        noteName: noteName,
        noteData: noteData,
      );
}

class _NotePageScreenState extends State<NotePageScreen> {
  String noteName;
  String noteData;

  _NotePageScreenState({
    required this.noteName,
    required this.noteData,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      child: Scaffold(
        appBar: AppBar(
          title: Text(noteName),
          centerTitle: true,
        ),
        body: Container(
          child: Text(noteData),
          margin: EdgeInsets.all(10.0),
        ),
      ),
      tag: noteName,
    );
  }
}
