// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';

import '../data/note.dart';

class NotePageScreen extends StatefulWidget {
  final Note note;
  final int numOfNotes;
  final Color descriptionColor;

  const NotePageScreen({
    Key? key,
    required this.note,
    required this.numOfNotes,
    required this.descriptionColor,
  }) : super(key: key);

  @override
  _NotePageScreenState createState() => _NotePageScreenState(
        note: note,
        numOfNotes: numOfNotes,
        descriptionColor: descriptionColor,
      );
}

class _NotePageScreenState extends State<NotePageScreen> {
  Note note;
  int numOfNotes;

  bool titleFillStatus = false;
  bool descriptionFillStatus = false;

  Color titleColor = Colors.white;
  Color descriptionColor;

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
    required this.descriptionColor,
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
    setState(
      () {
        titleFillStatus = false;
        descriptionFillStatus = false;
        FocusScope.of(context).unfocus();
        titleColor = Theme.of(context).primaryTextTheme.headline6!.color as Color;
        descriptionColor = Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white;
      },
    );
  }

  Future deleteNote(Note note) async {
    note.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      child: GestureDetector(
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
                  titleColor = Theme.of(context).primaryTextTheme.headline4!.color as Color;
                });
              },
              controller: noteTitleController,
              cursorHeight: 1,
              cursorWidth: 1,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                filled: titleFillStatus,
                fillColor: Colors.white,
                constraints: const BoxConstraints(
                  maxHeight: 30,
                  maxWidth: 400,
                ),
              ),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  showDialog<String>(
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(
                        'Are you sure you want to delete ${note.noteTitle}?',
                        textAlign: TextAlign.center,
                      ),
                      content: ElevatedButton(
                        child: const Text('Delete'),
                        onPressed: () {
                          deleteNote(note);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    context: context,
                  );
                },
              ),
              Visibility(
                child: IconButton(
                  icon: const Icon(Icons.save),
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
                  descriptionColor = Colors.black;
                });
              },
              controller: noteDescriptionController,
              cursorHeight: 1,
              cursorWidth: 1,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                filled: descriptionFillStatus,
                fillColor: Colors.white,
              ),
              minLines: 10,
              maxLines: 20,
              style: TextStyle(
                color: descriptionColor,
              ),
            ),
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 10.0,
            ),
          ),
        ),
        onTap: () {
          setState(
            () {
              titleFillStatus = false;
              descriptionFillStatus = false;
              titleColor = Theme.of(context).primaryTextTheme.headline6!.color as Color;
              descriptionColor = Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white;
              FocusScope.of(context).unfocus();
            },
          );
        },
      ),
      tag: note.noteTitle,
    );
  }
}
