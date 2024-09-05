// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoListsAdapter extends TypeAdapter<ToDoLists> {
  @override
  final int typeId = 0;

  @override
  ToDoLists read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoLists(
      title: fields[0] as String,
      date: fields[1] as DateTime?,
      isCompleted: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ToDoLists obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoListsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MyListsAdapter extends TypeAdapter<MyLists> {
  @override
  final int typeId = 1;

  @override
  MyLists read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyLists(
      name: fields[0] as String,
      colorValue: fields[1] as int,
      toDoLists: (fields[2] as HiveList?)?.castHiveList(),
    );
  }

  @override
  void write(BinaryWriter writer, MyLists obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.colorValue)
      ..writeByte(2)
      ..write(obj.toDoLists);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyListsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
