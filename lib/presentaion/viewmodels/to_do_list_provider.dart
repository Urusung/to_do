import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/data/models/to_do_list.dart';

final toDoListProvider =
    StateNotifierProvider<ToDoListProvider, List<ToDoList>>((ref) {
  return ToDoListProvider();
});

class ToDoListProvider extends StateNotifier<List<ToDoList>> {
  ToDoListProvider() : super([]);

  void addToDoList(String work) {
    state = [
      ...state,
      ToDoList(
        color: Colors.deepPurple,
        category: 'To Do List',
        id: state.length + 1,
        work: work,
        isComplete: false,
      ),
    ];
  }

  void toggleComplete(int id) {
    state = state.map((toDoList) {
      if (toDoList.id == id) {
        return ToDoList(
          color: Colors.deepPurple,
          category: toDoList.category,
          id: toDoList.id,
          work: toDoList.work,
          isComplete: !toDoList.isComplete,
        );
      }
      return toDoList;
    }).toList();
  }

  void delete(int id) {
    state = state.where((toDoList) => toDoList.id != id).toList();
  }
}