import 'package:hive/hive.dart';

import 'note.dart';

class Boxes {
  static Box<Note> getNotes() => Hive.box<Note>('notes');
}
