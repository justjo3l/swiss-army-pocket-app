// ignore_for_file: unused_import,prefer_const_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';

import './main.dart';
import './pages/note_page.dart';

import './data/note.dart';

class NoteListTile extends StatelessWidget {
  final Note note;
  final int numOfNotes;

  void noteClick(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NotePageScreen(
          note: note,
          numOfNotes: numOfNotes,
        ),
      ),
    );
  }

  NoteListTile({
    required this.note,
    required this.numOfNotes,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      child: GestureDetector(
        child: Container(
          child: Material(
            child: Column(
              children: [
                Text(
                  note.noteTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryTextTheme.headline5!.color,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  note.noteDescription,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryTextTheme.headline5!.color,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            color: Theme.of(context).cardColor,
          ),
          color: Theme.of(context).cardColor,
          margin: EdgeInsets.only(
            top: 20.0,
            left: note.noteIndex == 0 ? 40.0 : 10.0,
            right: note.noteIndex == numOfNotes - 1 ? 40.0 : 10.0,
          ),
          padding: EdgeInsets.all(5.0),
          width: MediaQuery.of(context).size.width * 0.80,
        ),
        onTap: () {
          noteClick(context);
        },
      ),
      tag: note.noteTitle,
    );
  }
}
