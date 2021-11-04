// ignore_for_file: unused_import, prefer_final_fields, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/note_list_view.dart';
import '../widgets/note_grid_view.dart';

import '../widgets/notes_app_bar.dart';
import '../animations/fade_animation.dart';

import '../main.dart';

import '../data/note.dart';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/boxes.dart';

import '../widgets/note_form.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();

  static _NotesScreenState of(BuildContext context) => context.findAncestorStateOfType<_NotesScreenState>() as _NotesScreenState;
}

class _NotesScreenState extends State<NotesScreen> {
  bool notesListFlag = false;

  bool notesListViewStatus = true;

  @override
  void dispose() {
    Hive.close();

    super.dispose();
  }

  Future addNote(int index, String title, String description, String color) async {
    final note = Note(
      noteIndex: index,
      noteTitle: title,
      noteDescription: description,
      noteColor: color,
      createdTime: DateTime.now(),
    );

    final box = Boxes.getNotes();
    box.add(note);
  }

  Future deleteNote(int index) async {
    final box = Boxes.getNotes();
    box.delete(index);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: NotesAppBar(
          titleText: 'Notes',
          titleIcon: Icon(Icons.notes_rounded),
        ),
        body: Stack(
          children: [
            Center(
              child: ValueListenableBuilder(
                  valueListenable: Boxes.getNotes().listenable(),
                  builder: (context, Box box, _) {
                    final notesList = box.values.toList().cast<Note>();
                    return notesListViewStatus
                        ? ConstrainedBox(
                            child: (notesList.isNotEmpty || notesListFlag) ? NotesListView() : Text('No Notes yet :('),
                            constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height * 0.45,
                            ),
                          )
                        : (notesList.isNotEmpty || notesListFlag)
                            ? NotesGridView()
                            : ConstrainedBox(
                                child: Text('No Notes yet :('),
                                constraints: BoxConstraints(
                                  maxHeight: MediaQuery.of(context).size.height * 0.45,
                                ),
                              );
                  }),
            ),
            Align(
              child: Container(
                child: RawMaterialButton(
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(
                        'Create a new Note',
                        textAlign: TextAlign.center,
                      ),
                      content: NoteForm(),
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  fillColor: Theme.of(context).primaryColor,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10.0),
                ),
                padding: EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                ),
              ),
              alignment: Alignment.bottomRight,
            ),
          ],
        ),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      onPanUpdate: (gestureDetails) {
        if (gestureDetails.delta.dy > 5) {
          Navigator.of(context).pop();
        }
      },
    );
  }

  void changeView(bool status) {
    setState(() {
      notesListViewStatus = status;
    });
  }
}
