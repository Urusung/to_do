import 'package:to_do_list_riverpod/data/models/to_do_lists_model.dart';
import 'package:uuid/uuid.dart';

class MyListsModel {
  final String id;
  final String name;
  final int colorValue;
  final List<ToDoListsModel> toDoLists;

  // id는 외부에서 받지 않고 항상 Uuid로 자동 생성
  MyListsModel({
    required this.name,
    required this.colorValue,
    required this.toDoLists,
  }) : id = const Uuid().v4(); // id는 Uuid로 항상 생성

  // Map에서 MyListsModel 객체 생성
  factory MyListsModel.fromMap(Map<String, dynamic> data) {
    return MyListsModel(
      name: data['name'],
      colorValue: data['colorValue'],
      toDoLists: List<ToDoListsModel>.from(
        (data['toDoLists'] as List).map(
          (x) => ToDoListsModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  // 객체를 Map으로 변환
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'colorValue': colorValue,
      'toDoLists': toDoLists.map((x) => x.toMap()).toList(),
    };
  }
}
