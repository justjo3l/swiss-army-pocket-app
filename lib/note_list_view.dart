import 'package:flutter/cupertino.dart';

//import './data/custom_scroll_physics.dart';

import './data/note_list_data.dart';
import './note_tile.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  NotesListViewState createState() => NotesListViewState();
}

class NotesListViewState extends State<NotesListView> {
  List notesList = NotesListData().notesList;

  @override
  Widget build(BuildContext context) {
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
  }
}
