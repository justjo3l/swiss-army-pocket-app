import 'package:flutter/material.dart';

import './note.dart';

class NotesListData {
  List<Note> notesList = [
    Note(
      noteIndex: 0,
      noteTitle: 'Note 1',
      noteDescription: 'First Random Note',
      noteColor: Colors.blue.toString(),
      createdTime: DateTime.now(),
    ),
    Note(
      noteIndex: 1,
      noteTitle: 'Note 2',
      noteDescription: 'Second Random Note',
      noteColor: Colors.green.toString(),
      createdTime: DateTime.now(),
    ),
    Note(
      noteIndex: 2,
      noteTitle: 'Note 3',
      noteDescription: 'Third Random Note',
      noteColor: Colors.red.toString(),
      createdTime: DateTime.now(),
    ),
    Note(
      noteIndex: 3,
      noteTitle: 'Note 4',
      noteDescription: 'Fourth Random Note',
      noteColor: Colors.purple.toString(),
      createdTime: DateTime.now(),
    ),
    Note(
      noteIndex: 4,
      noteTitle: 'Note 5',
      noteDescription: 'Fifth Random Note',
      noteColor: Colors.black.toString(),
      createdTime: DateTime.now(),
    ),
    Note(
      noteIndex: 5,
      noteTitle: 'Note 6',
      noteDescription: 'Sixth Random Note',
      noteColor: Colors.white.toString(),
      createdTime: DateTime.now(),
    ),
    Note(
      noteIndex: 6,
      noteTitle: 'Note 7',
      noteDescription: 'Seventh Random Note',
      noteColor: Colors.yellow.toString(),
      createdTime: DateTime.now(),
    ),
    Note(
      noteIndex: 7,
      noteTitle: 'Note 8',
      noteDescription: 'Eighth Random Note',
      noteColor: Colors.pink.toString(),
      createdTime: DateTime.now(),
    ),
  ];
}
