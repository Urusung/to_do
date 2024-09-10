import 'package:to_do_list_riverpod/data/datasources/database/local_data_source.dart';
import 'package:to_do_list_riverpod/data/models/to_do_lists_model.dart';

class ToDoListsRepository {
  final LocalDataSource localDataSource;

  ToDoListsRepository(this.localDataSource);

  // ToDoLists 데이터를 삽입
  Future<void> addToDoList(ToDoListsModel toDoList, String myListId) async {
    await localDataSource.insertToDoList(toDoList, myListId);
  }

  // 특정 MyLists에 속한 ToDoLists 데이터를 가져오기
  Future<List<ToDoListsModel>> getToDoLists(String myListId) async {
    return await localDataSource.getToDoLists(myListId);
  }

  // ToDoLists 삭제 메서드 (필요 시 추가)
  Future<void> deleteToDoList(String id) async {
    final db = await localDataSource.database;
    await db.delete('ToDoLists', where: 'id = ?', whereArgs: [id]);
  }
}
