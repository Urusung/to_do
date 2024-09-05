import 'package:to_do_list_riverpod/data/datasources/database/local_data_source.dart';
import 'package:to_do_list_riverpod/data/models/to_do_list.dart';

class ToDoListsRepository {
  final LocalDataSource localDataSource;

  ToDoListsRepository(this.localDataSource);

  List<ToDoLists> getAllToDoLists() {
    return localDataSource.getAllToDoLists();
  }

  Future<void> addToDoList(ToDoLists toDo) async {
    await localDataSource.addToDoList(toDo);
  }

  Future<void> deleteToDoList(ToDoLists toDo) async {
    await localDataSource.deleteToDoList(toDo);
  }
}
