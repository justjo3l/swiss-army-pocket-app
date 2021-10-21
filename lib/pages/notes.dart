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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        titleText: 'Notes',
        titleIcon: Icon(Icons.notes_rounded),
      ),
      body: FadeAnimation(
        delay: 2,
        child: Center(
          child: ValueListenableBuilder(
              valueListenable: Boxes.getNotes().listenable(),
              builder: (context, Box box, _) {
                final notesList = box.values.toList().cast<Note>();
                return ConstrainedBox(
                  child: (notesList.isNotEmpty || notesListFlag)
                      ? NotesListView()
                      : ElevatedButton(
                          onPressed: () {
                            addNote(0, 'First Note', 'First Random Description', Colors.blue.toString());
                          },
                          child: Text('Create Note')),
                  constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.40),
                );
              }),
        ),
        direction: 'down',
      ),
      backgroundColor: Theme.of(context).canvasColor,
    );
  }
}
