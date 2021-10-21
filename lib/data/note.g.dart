// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteAdapter extends TypeAdapter<Note> {
  @override
  final int typeId = 0;

  @override
  Note read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Note(
      noteIndex: fields[0] as int,
      noteTitle: fields[1] as String,
      noteDescription: fields[2] as String,
      noteColor: fields[3] as String,
      createdTime: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Note obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.noteIndex)
      ..writeByte(1)
      ..write(obj.noteTitle)
      ..writeByte(2)
      ..write(obj.noteDescription)
      ..writeByte(3)
      ..write(obj.noteColor)
      ..writeByte(4)
      ..write(obj.createdTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NoteAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
