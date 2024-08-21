import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/view_model/theme_provider.dart';

class ToDoListView extends ConsumerStatefulWidget {
  const ToDoListView({super.key});

  @override
  ConsumerState<ToDoListView> createState() => _ToDoListViewState();
}

class _ToDoListViewState extends ConsumerState<ToDoListView> {
  double scrollOffset = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        scrolledUnderElevation: 0,
        backgroundColor: scrollOffset > 42
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              CupertinoSliverNavigationBar(
                alwaysShowMiddle: false,
                backgroundColor: scrollOffset > 42
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).scaffoldBackgroundColor,
                border: Border(
                  bottom: BorderSide(
                    color: scrollOffset > 42
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
                  onTap: () {},
                ),
                trailing: GestureDetector(
                  child: Icon(
                    CupertinoIcons.brightness,
                    size: 28,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTap: () {
                    ref.read(themeProvider.notifier).changeTheme();
                  },
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
            ];
          },
          body: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  'Work',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            },
          ),
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
                body: const SafeArea(
                  child: Column(
                    children: [Text('data')],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
