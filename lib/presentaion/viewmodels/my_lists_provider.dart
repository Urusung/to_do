import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/data/models/my_lists_model.dart';
import 'package:to_do_list_riverpod/data/repositories/my_lists_repository.dart';
import 'package:to_do_list_riverpod/data/repositories/my_lists_repository_provider.dart';

// MyLists 상태를 관리하는 StateNotifierProvider
final myListsProvider =
    StateNotifierProvider<MyListsNotifier, List<MyListsModel>>((ref) {
  return MyListsNotifier(ref.read(myListsRepositoryProvider));
});

class MyListsNotifier extends StateNotifier<List<MyListsModel>> {
  final MyListsRepository myListsRepository;

  MyListsNotifier(this.myListsRepository) : super([]) {
    _loadMyLists(); // 초기 데이터를 로드
  }

  // MyLists 로드 메서드
  Future<void> _loadMyLists() async {
    try {
      // 데이터베이스에서 MyLists 데이터를 가져옴
      final myLists = await myListsRepository.getMyLists();
      // 상태 업데이트
      state = myLists;
    } catch (e) {
      // 에러 처리 (필요 시)
      print('Failed to load my lists: $e');
    }
  }

  // MyLists 추가 메서드
  Future<void> addMyList(MyListsModel myList) async {
    try {
      await myListsRepository.addMyList(myList);
      // 리스트를 다시 불러와 상태 업데이트
      _loadMyLists();
    } catch (e) {
      // 에러 처리
      print('Failed to add my list: $e');
    }
  }

  // MyLists 삭제 메서드 (필요 시)
  Future<void> deleteMyList(String id) async {
    try {
      await myListsRepository.deleteMyList(id);
      // 리스트를 다시 불러와 상태 업데이트
      _loadMyLists();
    } catch (e) {
      print('Failed to delete my list: $e');
    }
  }
}
