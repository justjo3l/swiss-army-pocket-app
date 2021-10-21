// ignore_for_file: unused_import, prefer_final_fields, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:swiss_army_pocket_app/note_list_view.dart';

import '../home_app_bar.dart';
import '../animations/fade_animation.dart';

import '../main.dart';

import '../data/note_list_data.dart';
import '../data/note.dart';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/boxes.dart';

import './../note_form.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  bool notesListFlag = false;

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
    return Scaffold(
      appBar: HomeAppBar(
        titleText: 'Notes',
        titleIcon: Icon(Icons.notes_rounded),
      ),
      body: FadeAnimation(
        delay: 2,
        child: Stack(
          children: [
            Center(
              child: ValueListenableBuilder(
                  valueListenable: Boxes.getNotes().listenable(),
                  builder: (context, Box box, _) {
                    final notesList = box.values.toList().cast<Note>();
                    return ConstrainedBox(
                      child: (notesList.isNotEmpty || notesListFlag) ? NotesListView() : Text('No Notes yet :('),
                      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.40),
                    );
                  }),
            ),
            Align(
              child: Container(
                child: Ink(
                  child: IconButton(
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
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  decoration: ShapeDecoration(shape: CircleBorder(), color: Theme.of(context).primaryColor),
                ),
                padding: EdgeInsets.all(10),
              ),
              alignment: Alignment.bottomRight,
            ),
          ],
        ),
        direction: 'down',
      ),
      backgroundColor: Theme.of(context).canvasColor,
    );
  }
}
