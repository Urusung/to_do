import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list_riverpod/data/models/my_lists_model.dart';
import 'package:to_do_list_riverpod/view/to_do_list_view/riverpod/to_do_list_provider.dart';
import 'package:to_do_list_riverpod/view/to_do_list_view/widgets/add_new_to_do_list_bottom_sheet_widget.dart';

class ToDoListView extends ConsumerWidget {
  final MyListModel myList;

  const ToDoListView({
    super.key,
    required this.myList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myListName = myList.name;
    final myListColor = Color(myList.colorValue);
    final myListId = myList.id;
    final toDoLists = ref.watch(toDoListProvider(myList.id));

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        toolbarHeight: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              alwaysShowMiddle: false,
              backgroundColor: Theme.of(context).canvasColor,
              border: const Border(),
              leading: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  width: 28,
                  color: Colors.transparent,
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 24,
                  ),
                ),
              ),
              middle: Text(
                myListName,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: myListColor),
              ),
              largeTitle: Text(
                myListName,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: myListColor),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: toDoLists.length,
                (context, index) {
                  return Slidable(
                    key: Key(toDoLists[index].id.toString()),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      dismissible: DismissiblePane(
                        onDismissed: () {
                          ref
                              .read(toDoListProvider(myList.id).notifier)
                              .deleteToDoList(toDoLists[index].id);
                        },
                      ),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            ref
                                .read(toDoListProvider(myList.id).notifier)
                                .deleteToDoList(toDoLists[index].id);
                          },
                          label: 'Delete',
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 16,
                            top: 8,
                            bottom: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  debugPrint('isCompleted');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: toDoLists[index].isCompleted
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Colors.transparent,
                                      border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                        width: 1.4,
                                      ),
                                    ),
                                    child: Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        color: toDoLists[index].isCompleted
                                            ? Colors.white
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    toDoLists[index].title,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  toDoLists[index].description.isEmpty
                                      ? const SizedBox()
                                      : Text(
                                          toDoLists[index].description,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 52),
                          height: 1,
                          color: Theme.of(context).dividerColor,
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 12, right: 16, bottom: 34),
        child: GestureDetector(
          child: Row(
            children: [
              Icon(
                CupertinoIcons.add_circled_solid,
                color: myListColor,
                size: 28,
              ),
              const Gap(8),
              Text(
                'New To Do List',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: myListColor,
                    ),
              ),
            ],
          ),
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return AddNewToDoListBottomSheetWidget(
                  myListId: myListId,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
