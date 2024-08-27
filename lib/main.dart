import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/theme/dark_theme.dart';
import 'package:to_do_list_riverpod/theme/light_theme.dart';
import 'package:to_do_list_riverpod/route/go_router_provider.dart';

void main() {
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
