import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list_riverpod/data/models/to_do_list.dart';
import 'package:to_do_list_riverpod/presentaion/views/my_lists.dart';
import 'package:to_do_list_riverpod/presentaion/views/to_do_list_view.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'myListsView',
          builder: (context, state) => const MyListsView(),
        ),
        GoRoute(
          path: '/to_do_list_view',
          name: 'toDoListsView',
          builder: (context, state) {
            final myList = state.extra as MyLists;
            return ToDoListsView(myList: myList);
          },
        ),
      ],
    );
  },
);
