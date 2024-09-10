import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/data/models/to_do_lists_model.dart';
import 'package:to_do_list_riverpod/data/repositories/to_do_lists_repository.dart';
import 'package:to_do_list_riverpod/data/repositories/to_do_lists_repository_provider.dart';

// ToDoLists 상태를 관리하는 StateNotifierProvider
final toDoListsProvider = StateNotifierProvider.family<ToDoListsNotifier,
    List<ToDoListsModel>, String>(
  (ref, myListId) =>
      ToDoListsNotifier(ref.read(toDoListsRepositoryProvider), myListId),
);

class ToDoListsNotifier extends StateNotifier<List<ToDoListsModel>> {
  final ToDoListsRepository toDoListsRepository;
  final String myListId;

  ToDoListsNotifier(this.toDoListsRepository, this.myListId) : super([]) {
    _loadToDoLists(); // 초기 데이터를 로드
  }

  // ToDoLists 로드 메서드
  Future<void> _loadToDoLists() async {
    try {
      // 데이터베이스에서 해당 MyList에 속한 ToDoLists 데이터를 가져옴
      final toDoLists = await toDoListsRepository.getToDoLists(myListId);
      print(toDoLists[0].myListId);
      // 상태 업데이트
      state = toDoLists;
    } catch (e) {
      // 에러 처리 (필요 시)
      print('Failed to load to-do lists: $e');
    }
  }

  // ToDoLists 추가 메서드
  Future<void> addToDoList(ToDoListsModel toDoList) async {
    try {
      await toDoListsRepository.addToDoList(toDoList, myListId);
      // 리스트를 다시 불러와 상태 업데이트
      _loadToDoLists();
    } catch (e) {
      // 에러 처리
      print('Failed to add to-do list: $e');
    }
  }

  // ToDoLists 삭제 메서드 (필요 시)
  Future<void> deleteToDoList(String id) async {
    try {
      await toDoListsRepository.deleteToDoList(id);
      // 리스트를 다시 불러와 상태 업데이트
      _loadToDoLists();
    } catch (e) {
      print('Failed to delete to-do list: $e');
    }
  }
}
