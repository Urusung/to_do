import 'package:to_do_list_riverpod/data/models/to_do_list_model.dart';

class MyListModel {
  String id;
  String name;
  int colorValue;
  List<ToDoListModel> toDoList;

  MyListModel({
    required this.id,
    required this.name,
    required this.colorValue,
    required this.toDoList,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'colorValue': colorValue,
    };
  }

  factory MyListModel.fromMap(Map<String, dynamic> map) {
    return MyListModel(
      id: map['id'],
      name: map['name'],
      colorValue: map['colorValue'],
      toDoList: [],
    );
  }
}
