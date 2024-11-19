import 'package:to_do_list_riverpod/data/datasources/database/local_data_source.dart';
import 'package:to_do_list_riverpod/data/models/to_do_list_model.dart';

class ToDoListRepository {
  final LocalDataSource localDataSource;

  ToDoListRepository(this.localDataSource);

  // ToDoList 데이터를 삽입
  Future<void> addToDoList(ToDoListModel toDoList, String myListId) async {
    await localDataSource.insertToDoList(toDoList, myListId);
  }

  // 특정 MyList에 속한 ToDoList 데이터를 가져오기
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

  // ToDoList 삭제 메서드 (필요 시 추가)
  Future<void> deleteToDoList(String id) async {
    final db = await localDataSource.database;
    await db.delete('ToDoList', where: 'id = ?', whereArgs: [id]);
  }
}
