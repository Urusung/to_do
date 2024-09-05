import 'package:hive/hive.dart';
import 'package:to_do_list_riverpod/data/models/to_do_list.dart';

class LocalDataSource {
  final Box<MyLists> _myListsBox;
  final Box<ToDoLists> _toDoListsBox;

  LocalDataSource(this._myListsBox, this._toDoListsBox);

  // MyLists 관련 작업
  List<MyLists> getAllMyLists() {
    return _myListsBox.values.toList();
  }

  Future<void> addMyList(MyLists list) async {
    await _myListsBox.add(list);
  }

  Future<void> deleteMyList(MyLists list) async {
    await _myListsBox.delete(list.key);
  }

  // ToDoLists 관련 작업
  List<ToDoLists> getAllToDoLists() {
    return _toDoListsBox.values.toList();
  }

  Future<void> addToDoList(ToDoLists toDo) async {
    await _toDoListsBox.add(toDo);
  }

  Future<void> deleteToDoList(ToDoLists toDo) async {
    await _toDoListsBox.delete(toDo.key);
  }
}
