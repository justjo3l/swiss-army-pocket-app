import 'package:flutter/material.dart';

import '../data/note.dart';
import '../data/boxes.dart';

class NoteForm extends StatefulWidget {
  NoteFormState createState() => NoteFormState();
}

class NoteFormState extends State<NoteForm> {
  final _formKey = GlobalKey<FormState>();

  late String formTitle;
  late String formDescription;
  String formColor = Colors.blue.toString();

  Future addNote(int index, String title, String description, String color) async {
    final note = Note(
      noteIndex: index,
      noteTitle: title,
      noteDescription: description,
      noteColor: color,
      createdTime: DateTime.now(),
    );

    final box = Boxes.getNotes();
    box.add(note);
  }

  int getNumOfNotes() {
    return Boxes.getNotes().length;
  }

  void buttonPressed() {
    _formKey.currentState!.save();
    addNote(getNumOfNotes(), formTitle, formDescription, formColor);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Note Title *',
            ),
            validator: (String? value) {
              return (value == null ? 'Note Title is required!' : null);
            },
            onSaved: (String? value) {
              formTitle = value as String;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Note Description *',
            ),
            validator: (String? value) {
              return (value == null ? 'Note Description is required!' : null);
            },
            onSaved: (String? value) {
              formDescription = value as String;
            },
          ),
          ElevatedButton(
            onPressed: buttonPressed,
            child: Text('Create'),
          ),
        ],
      ),
    );
  }
}
