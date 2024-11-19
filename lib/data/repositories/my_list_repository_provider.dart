import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/data/repositories/local_data_source_provider.dart';
import 'package:to_do_list_riverpod/data/repositories/my_list_repository.dart';

final myListRepositoryProvider = Provider<MyListRepository>((ref) {
  return MyListRepository(ref.read(localDataSourceProvider));
});
