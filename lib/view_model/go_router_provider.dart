import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list_riverpod/view/to_do_list_view.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const ToDoListView(),
        ),
      ],
    );
  },
);
