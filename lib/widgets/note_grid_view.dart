import 'package:flutter/material.dart';

import 'note_grid_tile.dart';
import '../data/note.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/boxes.dart';

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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return NoteGridTile(
                note: notesList[index],
                numOfNotes: notesList.length,
                descriptionColor: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
              );
            });
      },
    );
  }
}
