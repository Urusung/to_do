import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list_riverpod/presentaion/views/home_view.dart';
import 'package:to_do_list_riverpod/presentaion/views/to_do_list_view.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'main_view',
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          path: '/to_do_list_view',
          name: 'to_do_list_view',
          builder: (context, state) => const ToDoListView(),
        ),
      ],
    );
  },
);
