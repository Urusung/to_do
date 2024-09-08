import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/data/datasources/database/local_data_source.dart';
import 'package:to_do_list_riverpod/data/repositories/my_lists_repository.dart';
import 'package:to_do_list_riverpod/data/models/my_lists_model.dart';

// LocalDataSource Provider
final localDataSourceProvider = Provider<LocalDataSource>((ref) {
  return LocalDataSource.instance;
});

// MyListsRepository Provider
final myListsRepositoryProvider = Provider<MyListsRepository>((ref) {
  final localDataSource = ref.watch(localDataSourceProvider);
  return MyListsRepository(localDataSource);
});

// MyLists FutureProvider
final myListsProvider = FutureProvider<List<MyListsModel>>((ref) async {
  final repository = ref.watch(myListsRepositoryProvider);
  return repository.getMyLists();
});
