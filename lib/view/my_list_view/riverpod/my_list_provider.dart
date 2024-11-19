import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/data/models/my_list_model.dart';
import 'package:to_do_list_riverpod/data/repositories/my_list_repository.dart';
import 'package:to_do_list_riverpod/data/repositories/my_list_repository_provider.dart';

// MyList 상태를 관리하는 StateNotifierProvider
final myListProvider =
    StateNotifierProvider<MyListNotifier, List<MyListModel>>((ref) {
  return MyListNotifier(ref.read(myListRepositoryProvider));
});

class MyListNotifier extends StateNotifier<List<MyListModel>> {
  final MyListRepository myListRepository;

  MyListNotifier(this.myListRepository) : super([]) {
    loadMyList(); // 초기 데이터를 로드
  }

  // MyList 로드 메서드
  Future<void> loadMyList() async {
    try {
      // 데이터베이스에서 MyList 데이터를 가져옴
      final myList = await myListRepository.getMyList();
      // 상태 업데이트
      state = myList;
    } catch (e) {
      // 에러 처리 (필요 시)
      print('Failed to load my list: $e');
    }
  }

  // MyList 추가 메서드
  Future<void> addMyList(MyListModel myList) async {
    try {
      await myListRepository.addMyList(myList);
      // 리스트를 다시 불러와 상태 업데이트
      loadMyList();
    } catch (e) {
      // 에러 처리
      print('Failed to add my list: $e');
    }
  }

  // MyList 삭제 메서드 (필요 시)
  Future<void> deleteMyList(String id) async {
    try {
      await myListRepository.deleteMyList(id);
      // 리스트를 다시 불러와 상태 업데이트
      loadMyList();
    } catch (e) {
      print('Failed to delete my list: $e');
    }
  }
}
