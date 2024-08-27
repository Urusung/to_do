import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list_riverpod/view_model/scroll_controller_provider.dart';

class ToDoListView extends ConsumerWidget {
  const ToDoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollControllerOffset = ref.watch(scrollControllerOffsetProvider);
    final scrollController =
        ref.read(scrollControllerOffsetProvider.notifier).scrollController;

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        toolbarHeight: 0,
        scrolledUnderElevation: 0,
        backgroundColor: scrollControllerOffset > 42
            ? Theme.of(context).dialogBackgroundColor
            : Theme.of(context).canvasColor,
      ),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            CupertinoSliverNavigationBar(
              alwaysShowMiddle: false,
              backgroundColor: scrollControllerOffset > 42
                  ? Theme.of(context).dialogBackgroundColor
                  : Theme.of(context).canvasColor,
              border: Border(
                bottom: BorderSide(
                  color: scrollControllerOffset > 42
                      ? Theme.of(context).colorScheme.outline
                      : Theme.of(context).canvasColor,
                ),
              ),
              leading: GestureDetector(
                child: Icon(
                  CupertinoIcons.back,
                  size: 28,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onTap: () {
                  context.pop();
                },
              ),
              middle: Text(
                'To Do List',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              largeTitle: Text(
                'To Do List',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      'To Do $index',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: Icon(
          Icons.add,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        onPressed: () {},
      ),
    );
  }
}
