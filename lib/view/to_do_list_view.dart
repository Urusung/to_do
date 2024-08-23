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
      appBar: AppBar(
        toolbarHeight: 0,
        scrolledUnderElevation: 0,
        backgroundColor: scrollControllerOffset > 42
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            CupertinoSliverNavigationBar(
              alwaysShowMiddle: false,
              backgroundColor: scrollControllerOffset > 42
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).scaffoldBackgroundColor,
              border: Border(
                bottom: BorderSide(
                  color: scrollControllerOffset > 42
                      ? Theme.of(context).colorScheme.surface
                      : Theme.of(context).scaffoldBackgroundColor,
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
              trailing: GestureDetector(
                child: Icon(
                  CupertinoIcons.brightness,
                  size: 28,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onTap: () {},
              ),
              middle: Text(
                'To Do List',
                style: Theme.of(context).textTheme.titleMedium,
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
                    title: Text('To Do $index'),
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
        onPressed: () {
          showModalBottomSheet(
            backgroundColor:
                Theme.of(context).colorScheme.surfaceContainerHighest,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            builder: (BuildContext context) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leadingWidth: 100,
                  leading: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        overlayColor: WidgetStateColor.resolveWith(
                            (states) => Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                  actions: [
                    SizedBox(
                      width: 100,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            overlayColor: WidgetStateColor.resolveWith(
                                (states) => Colors.transparent),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Done',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                  title: Text(
                    'To Do',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                body: SafeArea(
                  child: Container(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
