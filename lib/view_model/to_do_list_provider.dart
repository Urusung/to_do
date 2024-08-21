import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/model/to_do_list.dart';

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
        id: state.length + 1,
        work: work,
      ),
    ];
  }

  void toggleComplete(int id) {
    state = state.map((toDoList) {
      if (toDoList.id == id) {
        return ToDoList(
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
