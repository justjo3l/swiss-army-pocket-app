import 'package:flutter/cupertino.dart';

//import './data/custom_scroll_physics.dart';

import './note_tile.dart';
import './data/note.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './data/boxes.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  NotesListViewState createState() => NotesListViewState();
}

class NotesListViewState extends State<NotesListView> {
  List notesList = Boxes.getNotes().values.toList();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Boxes.getNotes().listenable(),
      builder: (context, Box box, _) {
        final notesList = box.values.toList().cast<Note>();
        return ListView.builder(
            itemCount: notesList.length,
            //physics: NotesCustomScrollPhysics(context: context),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return NoteTile(
                note: notesList[index],
                numOfNotes: notesList.length,
              );
            });
      },
    );
  }
}
