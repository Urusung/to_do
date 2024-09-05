import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/data/repositories/my_lists_repository.dart';
import 'package:to_do_list_riverpod/presentaion/viewmodels/local_data_source_repository_provider.dart';

final myListsRepositoryProvider = StateProvider<MyListsRepository>((ref) {
  final localDataSource = ref.watch(localDataSourceProvider);
  return MyListsRepository(localDataSource);
});
