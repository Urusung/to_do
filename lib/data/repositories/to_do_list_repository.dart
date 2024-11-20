import 'package:to_do_list_riverpod/data/datasources/database/local_data_source.dart';
import 'package:to_do_list_riverpod/data/models/to_do_list_model.dart';

class ToDoListRepository {
  final LocalDataSource localDataSource;

  ToDoListRepository(this.localDataSource);

  Future<void> addToDoList(ToDoListModel toDoList, String myListId) async {
    await localDataSource.insertToDoList(toDoList, myListId);
  }

  Future<List<ToDoListModel>> getToDoList(String myListId) async {
    return await localDataSource.getToDoList(myListId);
  }

  Future<void> completeToDoList(String id, int isCompleted) async {
    final db = await localDataSource.database;
    await db.update(
      'ToDoList',
      {'isCompleted': isCompleted},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteToDoList(String id) async {
    final db = await localDataSource.database;
    await db.delete('ToDoList', where: 'id = ?', whereArgs: [id]);
  }
}
