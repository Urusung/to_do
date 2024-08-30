// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoListAdapter extends TypeAdapter<ToDoList> {
  @override
  final int typeId = 0;

  @override
  ToDoList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoList(
      id: fields[0] as int,
      work: fields[1] as String,
      category: fields[2] as String,
      color: fields[3] as Color,
      isComplete: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ToDoList obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.work)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.isComplete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
