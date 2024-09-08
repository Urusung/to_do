// import 'package:to_do_list_riverpod/data/datasources/database/local_data_source.dart';
// import 'package:to_do_list_riverpod/data/models/to_do_lists_model.dart';

// class ToDoListsRepository {
//   final LocalDataSource localDataSource;

//   ToDoListsRepository({required this.localDataSource});

//   Future<List<ToDoListModel>> getToDoLists() async {
//     return localDataSource.getToDoLists();
//   }

//   Future<void> insertToDoList(ToDoListModel toDoListModel) async {
//     return localDataSource.insertToDoList(toDoListModel);
//   }

//   Future<void> updateToDoList(ToDoListModel toDoListModel) async {
//     return localDataSource.updateToDoList(toDoListModel);
//   }

//   Future<void> deleteToDoList(ToDoListModel toDoListModel) async {
//     return localDataSource.deleteToDoList(toDoListModel);
//   }
// }