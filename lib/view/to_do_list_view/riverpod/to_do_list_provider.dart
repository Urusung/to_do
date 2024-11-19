import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/data/models/to_do_list_model.dart';
import 'package:to_do_list_riverpod/data/repositories/to_do_list_repository.dart';
import 'package:to_do_list_riverpod/data/repositories/to_do_list_repository_provider.dart';

// ToDoList 상태를 관리하는 StateNotifierProvider
final toDoListProvider =
    StateNotifierProvider.family<ToDoListNotifier, List<ToDoListModel>, String>(
  (ref, myListId) =>
      ToDoListNotifier(ref.read(toDoListRepositoryProvider), myListId),
);

class ToDoListNotifier extends StateNotifier<List<ToDoListModel>> {
  final ToDoListRepository toDoListRepository;
  final String myListId;

  ToDoListNotifier(this.toDoListRepository, this.myListId) : super([]) {
    _loadToDoList(); // 초기 데이터를 로드
  }

  // ToDoList 로드 메서드
  Future<void> _loadToDoList() async {
    try {
      // 데이터베이스에서 해당 MyList에 속한 ToDoList 데이터를 가져옴
      final toDoList = await toDoListRepository.getToDoList(myListId);
      // 상태 업데이트
      state = toDoList;
    } catch (e) {
      // 에러 처리 (필요 시)
      print('Failed to load to-do list: $e');
    }
  }

  // ToDoList 추가 메서드
  Future<void> addToDoList(ToDoListModel toDoList) async {
    try {
      await toDoListRepository.addToDoList(toDoList, myListId);
      // 리스트를 다시 불러와 상태 업데이트
      _loadToDoList();
    } catch (e) {
      // 에러 처리
      print('Failed to add to-do list: $e');
    }
  }

  // ToDoList 완료 메서드
  Future<void> completeToDoList(String id, int isCompleted) async {
    try {
      await toDoListRepository.completeToDoList(id, isCompleted);
      // 리스트를 다시 불러와 상태 업데이트
      _loadToDoList();
    } catch (e) {
      print('Failed to complete to-do list: $e');
    }
  }

  // ToDoList 삭제 메서드 (필요 시)
  Future<void> deleteToDoList(String id) async {
    try {
      await toDoListRepository.deleteToDoList(id);
      // 리스트를 다시 불러와 상태 업데이트
      _loadToDoList();
    } catch (e) {
      print('Failed to delete to-do list: $e');
    }
  }
}
