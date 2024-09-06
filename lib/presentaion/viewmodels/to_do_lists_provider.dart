import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/data/models/to_do_list.dart';
import 'package:to_do_list_riverpod/data/repositories/to_do_lists_repository.dart';
import 'package:to_do_list_riverpod/data/repositories/to_do_lists_repository_provider.dart';

// ToDoLists 상태를 관리하는 StateNotifierProvider
final toDoListsProvider =
    StateNotifierProvider.family<ToDoListsNotifier, List<ToDoLists>, MyLists>(
  (ref, myList) =>
      ToDoListsNotifier(ref.read(toDoListsRepositoryProvider), myList),
);

class ToDoListsNotifier extends StateNotifier<List<ToDoLists>> {
  final ToDoListsRepository toDoListsRepository;
  final MyLists myList;

  ToDoListsNotifier(this.toDoListsRepository, this.myList) : super([]) {
    _loadToDoLists(); // 초기 데이터를 로드
  }

  // ToDoLists 로드 메서드
  void _loadToDoLists() {
    state = myList.toDoLists?.toList() ?? [];
  }

  // ToDoLists 추가 메서드
  Future<void> addToDoList(String title, DateTime? date) async {
    final newToDo = ToDoLists(
      title: title,
      date: date,
    );
    myList.toDoLists?.add(newToDo);
    await myList.save(); // MyLists에 저장된 ToDoLists를 업데이트
    state = [...state, newToDo]; // 상태를 업데이트
  }

  // ToDoLists 삭제 메서드
  Future<void> deleteToDoList(ToDoLists toDo) async {
    myList.toDoLists?.remove(toDo);
    await myList.save(); // MyLists에 저장된 ToDoLists 업데이트
    state = state.where((item) => item != toDo).toList(); // 상태 업데이트
  }

  // ToDoLists 완료 상태 토글 메서드
  // Future<void> toggleToDoCompletion(ToDoLists toDo) async {
  //   toDo.isCompleted = !toDo.isCompleted; // 완료 상태 토글
  //   await myList.save(); // 상태 변경 후 저장
  //   state = [...state]; // 상태 갱신
  // }
}
