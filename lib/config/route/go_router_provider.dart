import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list_riverpod/data/models/my_lists_model.dart';
import 'package:to_do_list_riverpod/view/my_list_view/my_list_view.dart';
import 'package:to_do_list_riverpod/view/to_do_list_view/to_do_list_view.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'myListsView',
          builder: (context, state) => const MyListView(),
        ),
        GoRoute(
          path: '/to_do_list_view',
          name: 'toDoListsView',
          builder: (context, state) {
            final myList = state.extra as MyListModel;
            return ToDoListView(myList: myList);
          },
        ),
      ],
    );
  },
);
