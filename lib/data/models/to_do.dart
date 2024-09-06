import 'package:hive/hive.dart';

part 'to_do.g.dart';

@HiveType(typeId: 0)
class ToDoLists extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  DateTime? date;

  @HiveField(2)
  bool isCompleted;

  ToDoLists({
    required this.title,
    this.date,
    this.isCompleted = false,
  });
}

@HiveType(typeId: 1)
class MyLists extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int colorValue;

  @HiveField(2)
  HiveList<ToDoLists>? toDoLists;

  MyLists({
    required this.name,
    required this.colorValue,
    this.toDoLists,
  });
}
