// ignore_for_file: type_init_formals, no_logic_in_create_state, prefer_const_constructors, unnecessary_cast

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

  late String newNoteTitle;
  late String newNoteDescription;

  bool saveOptionShown = false;

  _NotePageScreenState({
    required this.note,
    required this.numOfNotes,
  });

  Future saveRequired() async {
    setState(() {
      saveOptionShown = true;
    });
  }

  Future saveNotRequired() async {
    setState(() {
      saveOptionShown = false;
    });
  }

  Future editNoteTitle(Note note, String newNoteTitle) async {
    note.noteTitle = newNoteTitle;
    note.save();
    saveNotRequired();
  }

  Future editNoteDescription(Note note, String newNoteDescription) async {
    note.noteDescription = newNoteDescription;
    note.save();
    saveNotRequired();
  }

  Future deleteNote(Note note) async {
    note.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      child: Scaffold(
        appBar: AppBar(
          title: TextFormField(
            initialValue: note.noteTitle,
            onChanged: (text) {
              if (text != note.noteTitle) {
                saveRequired();
              } else {
                saveNotRequired();
              }
            },
            onFieldSubmitted: (text) {
              newNoteTitle = text as String;
              editNoteTitle(note, newNoteTitle);
            },
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                deleteNote(note);
                Navigator.of(context).pop();
              },
            ),
            Visibility(
              child: IconButton(
                icon: Icon(Icons.radar_sharp),
                onPressed: () {},
              ),
              visible: saveOptionShown,
            )
          ],
        ),
        body: Container(
          child: TextFormField(
            initialValue: note.noteDescription,
            onChanged: (text) {
              if (text != note.noteDescription) {
                saveRequired();
              } else {
                saveNotRequired();
              }
            },
            onFieldSubmitted: (text) {
              newNoteDescription = text as String;
              editNoteDescription(note, newNoteDescription);
            },
          ),
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.only(
            top: 10.0,
            left: 10.0,
          ),
        ),
      ),
      tag: note.noteTitle,
    );
  }
}
