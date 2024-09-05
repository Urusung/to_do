// LocalDataSource Provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_riverpod/data/datasources/database/local_data_source.dart';
import 'package:to_do_list_riverpod/data/models/to_do_list.dart';

final localDataSourceProvider = StateProvider<LocalDataSource>((ref) {
  // Hive Box 열기 등을 여기서 처리 (필요에 따라 수정)
  final myListsBox = Hive.box<MyLists>('myLists');
  final toDoListsBox = Hive.box<ToDoLists>('toDoLists');
  return LocalDataSource(myListsBox, toDoListsBox);
});
