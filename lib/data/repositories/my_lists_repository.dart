import 'package:to_do_list_riverpod/data/datasources/database/local_data_source.dart';
import 'package:to_do_list_riverpod/data/models/my_lists_model.dart';

class MyListsRepository {
  final LocalDataSource localDataSource;

  MyListsRepository(this.localDataSource);

  Future<void> addMyList(MyListsModel list) async {
    await localDataSource.insertMyList(list);
  }

  Future<List<MyListsModel>> getMyLists() async {
    return await localDataSource.getAllMyLists();
  }

  Future<void> updateMyList(MyListsModel list) async {
    await localDataSource.updateMyList(list);
  }

  Future<void> deleteMyList(String name) async {
    await localDataSource.deleteMyList(name);
  }
}
