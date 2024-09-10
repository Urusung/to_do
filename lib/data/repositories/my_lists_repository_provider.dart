import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/data/repositories/local_data_source_provider.dart';
import 'package:to_do_list_riverpod/data/repositories/my_lists_repository.dart';

final myListsRepositoryProvider = Provider<MyListsRepository>((ref) {
  return MyListsRepository(ref.read(localDataSourceProvider));
});
