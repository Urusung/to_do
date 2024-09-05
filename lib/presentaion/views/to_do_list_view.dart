import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list_riverpod/data/models/to_do_list.dart';
import 'package:to_do_list_riverpod/presentaion/viewmodels/scroll_controller_provider.dart';
import 'package:to_do_list_riverpod/presentaion/viewmodels/to_do_lists_provider.dart';

class ToDoListsView extends ConsumerWidget {
  final MyLists myList;

  const ToDoListsView({
    super.key,
    required this.myList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myListName = myList.name;
    final myListColor = myList.colorValue;
    final toDoLists = ref.watch(toDoListsProvider(myList));

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
                myListName,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Color(myListColor)),
              ),
              largeTitle: Text(
                myListName,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Color(myListColor)),
              ),
            ),
            SliverList.builder(
              itemCount: toDoLists.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print(index);
                  },
                  child: Slidable(
                    key: Key(toDoLists[index].key.toString()),
                    endActionPane: ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            toDoLists[index].title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Checkbox(
                            value: toDoLists[index].isCompleted,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: FaIcon(
          FontAwesomeIcons.plus,
          size: 18,
          color: Theme.of(context).canvasColor,
        ),
        onPressed: () {},
      ),
    );
  }
}
