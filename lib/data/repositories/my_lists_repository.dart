import 'package:to_do_list_riverpod/data/datasources/database/local_data_source.dart';
import 'package:to_do_list_riverpod/data/models/my_lists_model.dart';

class MyListsRepository {
  final LocalDataSource localDataSource;

  MyListsRepository(this.localDataSource);

  // MyLists 데이터를 삽입
  Future<void> addMyList(MyListModel myList) async {
    await localDataSource.insertMyList(myList);
  }

  // MyLists 데이터를 가져오기
  Future<List<MyListModel>> getMyList() async {
    return await localDataSource.getMyLists();
  }

  // MyLists 삭제 메서드 (필요 시 추가)
  Future<void> deleteMyList(String id) async {
    final db = await localDataSource.database;
    await db.delete('MyLists', where: 'id = ?', whereArgs: [id]);
  }
}
