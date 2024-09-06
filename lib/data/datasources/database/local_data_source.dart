import 'package:hive/hive.dart';
import 'package:to_do_list_riverpod/data/models/to_do.dart';

class LocalDataSource {
  final Box<MyLists> myListsBox;
  final Box<ToDoLists> toDoListsBox;

  LocalDataSource(this.myListsBox, this.toDoListsBox);

  List<MyLists> getAllMyLists() {
    return myListsBox.values.toList();
  }

  Future<void> addMyList(MyLists list) async {
    await myListsBox.add(list);
  }

  Future<void> deleteMyList(MyLists list) async {
    await myListsBox.delete(list.key);
  }

  List<ToDoLists> getAllToDoLists() {
    return toDoListsBox.values.toList();
  }

  Future<void> addToDoList(ToDoLists toDo) async {
    await toDoListsBox.add(toDo);
  }

  Future<void> deleteToDoList(ToDoLists toDo) async {
    await toDoListsBox.delete(toDo.key);
  }
}
