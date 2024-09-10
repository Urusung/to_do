import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/data/datasources/database/local_data_source.dart';

final localDataSourceProvider = StateProvider<LocalDataSource>((ref) {
  return LocalDataSource();
});
