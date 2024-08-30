import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'to_do_list.g.dart';

@HiveType(typeId: 0)
class ToDoList extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String work;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final Color color;

  @HiveField(4)
  final bool isComplete;

  ToDoList({
    required this.id,
    required this.work,
    required this.category,
    required this.color,
    required this.isComplete,
  });
}
