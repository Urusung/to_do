import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_riverpod/data/datasources/database/local_data_source.dart';
import 'package:to_do_list_riverpod/data/models/to_do_list.dart';

class MyListsRepository {
  final LocalDataSource localDataSource;

  MyListsRepository(this.localDataSource);

  List<MyLists> getAllMyLists() {
    return localDataSource.getAllMyLists();
  }

  Future<void> addMyList(MyLists list) async {
    await localDataSource.addMyList(list);
  }

  Future<void> deleteMyList(MyLists list) async {
    await localDataSource.deleteMyList(list);
  }

  HiveList<ToDoLists>? getToDoListsForMyList(MyLists list) {
    return list.toDoLists;
  }
}
