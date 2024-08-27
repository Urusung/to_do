import 'package:flutter/material.dart';

class ToDoList {
  final Color color;
  final String category;
  final int id;
  final String work;
  final bool isComplete;

  ToDoList(
      {required this.color,
      required this.category,
      required this.id,
      required this.work,
      this.isComplete = false});
}
