// ignore_for_file: type_init_formals, no_logic_in_create_state, prefer_const_constructors

import 'package:flutter/material.dart';

import '../data/note.dart';

class NotePageScreen extends StatefulWidget {
  final Note note;
  final int numOfNotes;

  const NotePageScreen({
    Key? key,
    required Note this.note,
    required int this.numOfNotes,
  }) : super(key: key);

  @override
  _NotePageScreenState createState() => _NotePageScreenState(
        note: note,
        numOfNotes: numOfNotes,
      );
}

class _NotePageScreenState extends State<NotePageScreen> {
  Note note;
  int numOfNotes;

  _NotePageScreenState({
    required this.note,
    required this.numOfNotes,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      child: Scaffold(
        appBar: AppBar(
          title: Text(note.noteTitle),
          centerTitle: true,
        ),
        body: Container(
          child: Text(note.noteDescription),
          margin: EdgeInsets.all(10.0),
        ),
      ),
      tag: note.noteTitle,
    );
  }
}
