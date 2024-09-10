import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/data/repositories/local_data_source_provider.dart';
import 'package:to_do_list_riverpod/data/repositories/to_do_lists_repository.dart';

// ToDoListsRepository의 provider 정의
final toDoListsRepositoryProvider = Provider<ToDoListsRepository>((ref) {
  return ToDoListsRepository(ref.read(localDataSourceProvider));
});
