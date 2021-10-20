// ignore_for_file: unused_import, prefer_final_fields, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:swiss_army_pocket_app/note_list_view.dart';

import '../home_app_bar.dart';
import '../animations/fade_animation.dart';

import '../main.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
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
            child: NotesListView(),
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.40),
          ),
        ),
        direction: 'down',
      ),
      backgroundColor: Theme.of(context).canvasColor,
    );
  }
}
