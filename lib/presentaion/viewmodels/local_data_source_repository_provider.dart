import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_riverpod/data/datasources/database/local_data_source.dart';
import 'package:to_do_list_riverpod/data/models/to_do_list.dart';

final localDataSourceProvider = StateProvider<LocalDataSource>((ref) {
  final myListsBox = Hive.box<MyLists>('myLists');
  final toDoListsBox = Hive.box<ToDoLists>('toDoLists');
  return LocalDataSource(myListsBox, toDoListsBox);
});
