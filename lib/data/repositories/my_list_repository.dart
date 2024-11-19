import 'package:to_do_list_riverpod/data/datasources/database/local_data_source.dart';
import 'package:to_do_list_riverpod/data/models/my_list_model.dart';

class MyListRepository {
  final LocalDataSource localDataSource;

  MyListRepository(this.localDataSource);

  // MyList 데이터를 삽입
  Future<void> addMyList(MyListModel myList) async {
    await localDataSource.insertMyList(myList);
  }

  // MyList 데이터를 가져오기
  Future<List<MyListModel>> getMyList() async {
    return await localDataSource.getMyList();
  }

  // MyList 삭제 메서드 (필요 시 추가)
  Future<void> deleteMyList(String id) async {
    final db = await localDataSource.database;
    await db.delete('MyList', where: 'id = ?', whereArgs: [id]);
  }
}
