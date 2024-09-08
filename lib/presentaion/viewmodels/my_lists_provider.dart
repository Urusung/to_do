import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/data/repositories/my_lists_repository.dart';
import 'package:to_do_list_riverpod/data/models/my_lists_model.dart';
import 'package:to_do_list_riverpod/data/repositories/my_lists_repository_provider.dart';

// MyLists 상태를 관리하는 StateNotifierProvider
final myListsProvider =
    StateNotifierProvider<MyListsNotifier, List<MyListsModel>>(
  (ref) => MyListsNotifier(ref.read(myListsRepositoryProvider)),
);

class MyListsNotifier extends StateNotifier<List<MyListsModel>> {
  final MyListsRepository myListsRepository;

  MyListsNotifier(this.myListsRepository) : super([]) {
    _loadMyLists(); // 초기 데이터 로드
  }

  // 데이터 로드 메서드
  Future<void> _loadMyLists() async {
    final lists = await myListsRepository.getMyLists();
    state = lists; // 상태를 리스트로 업데이트
  }

  // 리스트 추가 메서드
  Future<void> addList(String name, int colorValue) async {
    final newList = MyListsModel(
      name: name,
      colorValue: colorValue,
      toDoLists: [], // 새로운 리스트에 할 일은 처음에는 없음
    );
    await myListsRepository.addMyList(newList); // 로컬 데이터베이스에 추가
    state = [...state, newList]; // 상태 업데이트
  }

  // 리스트 삭제 메서드
  Future<void> deleteList(MyListsModel list) async {
    await myListsRepository.deleteMyList(list.name); // 로컬 데이터베이스에서 삭제
    state =
        state.where((element) => element.name != list.name).toList(); // 상태 업데이트
  }
}
