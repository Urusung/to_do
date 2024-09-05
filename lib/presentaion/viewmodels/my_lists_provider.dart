import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/data/repositories/my_lists_repository.dart';
import 'package:to_do_list_riverpod/data/models/to_do_list.dart';
import 'package:to_do_list_riverpod/presentaion/viewmodels/my_lists_repository_provider.dart';

// MyLists 상태를 관리하는 StateNotifierProvider
final myListsProvider = StateNotifierProvider<MyListsNotifier, List<MyLists>>(
  (ref) => MyListsNotifier(ref.read(myListsRepositoryProvider)),
);

class MyListsNotifier extends StateNotifier<List<MyLists>> {
  final MyListsRepository myListsRepository;

  MyListsNotifier(this.myListsRepository) : super([]) {
    _loadMyLists(); // 초기 데이터 로드
  }

  // 데이터 로드 메서드
  Future<void> _loadMyLists() async {
    final lists = myListsRepository.getAllMyLists();
    state = lists; // 상태를 리스트로 업데이트
  }

  // 리스트 추가 메서드
  Future<void> addList(String name, int colorValue) async {
    final newList = MyLists(
      name: name,
      colorValue: colorValue,
    );
    await myListsRepository.addMyList(newList); // 로컬 데이터에 추가
    state = [...state, newList]; // 상태 업데이트
  }

  // 리스트 삭제 메서드
  Future<void> deleteList(MyLists list) async {
    await myListsRepository.deleteMyList(list); // 로컬 데이터에서 삭제
    state =
        state.where((element) => element.key != list.key).toList(); // 상태 업데이트
  }

  // 특정 MyLists에 할 일 추가 메서드
  Future<void> addToDoToList(MyLists list, ToDoLists toDo) async {
    list.toDoLists?.add(toDo);
    await list.save(); // Hive에서 MyLists 객체 저장
    state = [...state]; // 상태 갱신
  }
}
