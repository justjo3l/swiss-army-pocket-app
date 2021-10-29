// ignore_for_file: annotate_overrides, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../data/note.dart';
import '../../data/boxes.dart';

class NoteForm extends StatefulWidget {
  NoteFormState createState() => NoteFormState();
}

class NoteFormState extends State<NoteForm> {
  var formKey = GlobalKey<FormState>();

  String noteTitleErrorText = '';
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
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      addNote(getNumOfNotes(), formTitle, formDescription, formColor);
      Navigator.of(context).pop();
    } else {
      formKey.currentState!.validate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Note Title *',
                errorText: noteTitleErrorText,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Note Title is required!';
                } else {
                  return null;
                }
              },
              onSaved: (String? value) {
                formTitle = value as String;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Note Description',
              ),
              minLines: 2,
              maxLines: 2,
              onSaved: (String? value) {
                formDescription = value as String;
              },
            ),
            ElevatedButton(
              onPressed: buttonPressed,
              child: Text('Create'),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.40,
    );
  }
}
