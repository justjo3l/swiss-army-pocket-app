// ignore_for_file: unused_import, prefer_final_fields, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';

import './home_app_bar.dart';
import './note_container.dart';
import './fade_animation.dart';

import './main.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List notesList = [
    {'noteName': 'Note 1', 'noteData': 'First Random Note'},
    {'noteName': 'Note 2', 'noteData': 'Second Random Note'},
    {'noteName': 'Note 3', 'noteData': 'Third Random Note'},
    {'noteName': 'Note 4', 'noteData': 'Fourth Random Note'},
  ];

  List<NoteContainer> _notesContainerList(int count) => List.generate(
        count,
        (i) => NoteContainer(
          noteName: notesList[i]['noteName'],
          noteData: notesList[i]['noteData'],
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
          child: GridView.extent(
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            maxCrossAxisExtent: 150,
            children: [..._notesContainerList(notesList.length)],
          ),
          direction: 'down',
        ),
        backgroundColor: Theme.of(context).canvasColor);
  }
}
