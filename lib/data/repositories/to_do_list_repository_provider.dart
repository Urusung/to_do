import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/data/repositories/local_data_source_provider.dart';
import 'package:to_do_list_riverpod/data/repositories/to_do_list_repository.dart';

// ToDoListRepository의 provider 정의
final toDoListRepositoryProvider = Provider<ToDoListRepository>((ref) {
  return ToDoListRepository(ref.read(localDataSourceProvider));
});
