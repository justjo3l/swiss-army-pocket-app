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

  bool titleFillStatus = false;
  bool descriptionFillStatus = false;

  late String newNoteTitle;
  late String newNoteDescription;

  bool saveOptionShown = false;

  late TextEditingController noteTitleController;
  late TextEditingController noteDescriptionController;

  @override
  void initState() {
    super.initState();
    noteTitleController = TextEditingController(
      text: note.noteTitle,
    );
    noteDescriptionController = TextEditingController(
      text: note.noteDescription,
    );
  }

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

  Future editNote(Note note, String newNoteTitle, String newNoteDescription) async {
    note.noteTitle = newNoteTitle;
    note.noteDescription = newNoteDescription;
    note.save();
    saveNotRequired();
    setState(() {
      titleFillStatus = false;
      descriptionFillStatus = false;
    });
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
            onChanged: (text) {
              if (text != note.noteTitle) {
                saveRequired();
              } else {
                saveNotRequired();
              }
            },
            onTap: () {
              setState(() {
                titleFillStatus = true;
              });
            },
            controller: noteTitleController,
            cursorHeight: 1,
            cursorWidth: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              filled: titleFillStatus,
              fillColor: Colors.white,
              constraints: BoxConstraints(
                maxHeight: 30,
                maxWidth: 400,
              ),
            ),
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
                icon: Icon(Icons.save),
                onPressed: () {
                  newNoteTitle = noteTitleController.text;
                  newNoteDescription = noteDescriptionController.text;
                  editNote(note, newNoteTitle, newNoteDescription);
                },
              ),
              visible: saveOptionShown,
            )
          ],
        ),
        body: Container(
          child: TextFormField(
            onChanged: (text) {
              if (text != note.noteDescription) {
                saveRequired();
              } else {
                saveNotRequired();
              }
            },
            onTap: () {
              setState(() {
                descriptionFillStatus = true;
              });
            },
            controller: noteDescriptionController,
            cursorHeight: 1,
            cursorWidth: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              filled: descriptionFillStatus,
              fillColor: Colors.white,
            ),
            minLines: 10,
            maxLines: 20,
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
