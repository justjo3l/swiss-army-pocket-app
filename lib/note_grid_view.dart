// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';

//import './data/custom_scroll_physics.dart';

import 'note_grid_tile.dart';
import './data/note.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './data/boxes.dart';

class NotesGridView extends StatefulWidget {
  const NotesGridView({Key? key}) : super(key: key);

  @override
  NotesGridViewState createState() => NotesGridViewState();
}

class NotesGridViewState extends State<NotesGridView> {
  List notesList = Boxes.getNotes().values.toList();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Boxes.getNotes().listenable(),
      builder: (context, Box box, _) {
        final notesList = box.values.toList().cast<Note>();
        return GridView.builder(
            itemCount: notesList.length,
            //physics: NotesCustomScrollPhysics(context: context),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return NoteGridTile(
                note: notesList[index],
                numOfNotes: notesList.length,
              );
            });
      },
    );
  }
}
