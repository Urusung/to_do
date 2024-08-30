import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_riverpod/config/theme/dark_theme.dart';
import 'package:to_do_list_riverpod/config/theme/light_theme.dart';
import 'package:to_do_list_riverpod/config/route/go_router_provider.dart';
import 'package:to_do_list_riverpod/data/models/to_do_list.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoListAdapter());
  await Hive.openBox<ToDoList>('toDoListBox');
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
