import 'package:to_do_list_riverpod/data/models/to_do_lists_model.dart';

class MyListModel {
  String id;
  String name;
  int colorValue;
  List<ToDoListsModel> toDoLists;

  MyListModel({
    required this.id,
    required this.name,
    required this.colorValue,
    required this.toDoLists,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'colorValue': colorValue,
      // toDoLists는 별도 테이블에서 관리하기 때문에 여기서는 변환하지 않음
    };
  }

  factory MyListModel.fromMap(Map<String, dynamic> map) {
    return MyListModel(
      id: map['id'],
      name: map['name'],
      colorValue: map['colorValue'],
      toDoLists: [], // toDoLists는 별도 쿼리를 통해 불러옴
    );
  }
}
