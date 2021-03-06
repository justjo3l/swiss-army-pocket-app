import 'package:flutter/material.dart';
import '../widgets/note_list_view.dart';
import '../widgets/note_grid_view.dart';

import '../widgets/notes_app_bar.dart';

import '../data/note.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/boxes.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  _NotesScreenState createState() => _NotesScreenState();

  static _NotesScreenState of(BuildContext context) => context.findAncestorStateOfType<_NotesScreenState>() as _NotesScreenState;
}

class _NotesScreenState extends State<NotesScreen> {
  bool notesListFlag = false;

  bool notesListViewStatus = true;

  @override
  void dispose() {
    Hive.close();

    super.dispose();
  }

  Future addNote() async {
    final note = Note(
      noteIndex: Boxes.getNotes().length,
      noteTitle: 'Note #${Boxes.getNotes().length + 1}',
      noteDescription: '',
      noteColor: 'Transperent',
      createdTime: DateTime.now(),
    );

    final box = Boxes.getNotes();
    box.add(note);
  }

  Future deleteNote(int index) async {
    final box = Boxes.getNotes();
    box.delete(index);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: const NotesAppBar(
          titleText: 'Notes',
          titleIcon: Icon(Icons.notes_rounded),
        ),
        body: Stack(
          children: [
            Center(
              child: ValueListenableBuilder(
                  valueListenable: Boxes.getNotes().listenable(),
                  builder: (context, Box box, _) {
                    final notesList = box.values.toList().cast<Note>();
                    return notesListViewStatus
                        ? ConstrainedBox(
                            child: (notesList.isNotEmpty || notesListFlag) ? const NotesListView() : const Text('No Notes yet :('),
                            constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height * 0.45,
                            ),
                          )
                        : (notesList.isNotEmpty || notesListFlag)
                            ? const NotesGridView()
                            : ConstrainedBox(
                                child: const Text('No Notes yet :('),
                                constraints: BoxConstraints(
                                  maxHeight: MediaQuery.of(context).size.height * 0.45,
                                ),
                              );
                  }),
            ),
            Align(
              child: Container(
                child: RawMaterialButton(
                  onPressed: addNote,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  fillColor: Theme.of(context).primaryColor,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10.0),
                ),
                padding: const EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                ),
              ),
              alignment: Alignment.bottomRight,
            ),
          ],
        ),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      onPanUpdate: (gestureDetails) {
        if (gestureDetails.delta.dy > 5) {
          Navigator.of(context).pop();
        }
      },
    );
  }

  void changeView(bool status) {
    setState(() {
      notesListViewStatus = status;
    });
  }
}
