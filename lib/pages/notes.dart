// ignore_for_file: unused_import, prefer_final_fields, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';

import '../home_app_bar.dart';
import '../note_container.dart';
import '../animations/fade_animation.dart';

import '../main.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List notesList = [
    {
      'noteName': 'Note 1',
      'noteData': 'First Random Note',
      'noteIndex': 0,
      'noteColor': Colors.blue,
    },
    {
      'noteName': 'Note 2',
      'noteData': 'Second Random Note',
      'noteIndex': 1,
      'noteColor': Colors.green,
    },
    {
      'noteName': 'Note 3',
      'noteData': 'Third Random Note',
      'noteIndex': 2,
      'noteColor': Colors.red,
    },
    {
      'noteName': 'Note 4',
      'noteData': 'Fourth Random Note',
      'noteIndex': 3,
      'noteColor': Colors.purple,
    },
  ];

  List<NoteContainer> _notesContainerList(int count) => List.generate(
        count,
        (i) => NoteContainer(
          noteName: notesList[i]['noteName'],
          noteData: notesList[i]['noteData'],
          noteIndex: notesList[i]['noteIndex'],
          noteColor: notesList[i]['noteIndex'],
          numOfNotes: notesList.length,
        ),
      );

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
              children: [..._notesContainerList(notesList.length)],
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
