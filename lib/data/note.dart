import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  late int noteIndex;

  @HiveField(1)
  late String noteTitle;

  @HiveField(2)
  late String noteDescription;

  @HiveField(3)
  late String noteColor;

  @HiveField(4)
  late DateTime createdTime;

  Note({required this.noteIndex, required this.noteTitle, required this.noteColor, required this.noteDescription, required this.createdTime});
}
