// ignore_for_file: unused_import, prefer_final_fields, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';

import '../home_app_bar.dart';
import '../note_tile.dart';
import '../animations/fade_animation.dart';

import '../main.dart';

import '../data/notes_list_data.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List notesList = NotesListData().notesList;

  List<NoteTile> _noteTileList(int count) {
    return List.generate(
      count,
      (i) => NoteTile(
        noteName: notesList[i]['noteName'],
        noteData: notesList[i]['noteData'],
        noteIndex: notesList[i]['noteIndex'],
        noteColor: notesList[i]['noteColor'],
        numOfNotes: notesList.length,
      ),
    );
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
          child: ConstrainedBox(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [..._noteTileList(notesList.length)],
            ),
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.40),
          ),
        ),
        direction: 'down',
      ),
      backgroundColor: Theme.of(context).canvasColor,
    );
  }
}
