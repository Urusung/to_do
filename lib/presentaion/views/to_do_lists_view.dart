import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list_riverpod/data/models/my_lists_model.dart';
import 'package:to_do_list_riverpod/data/models/to_do_lists_model.dart';
import 'package:to_do_list_riverpod/presentaion/viewmodels/to_do_lists_provider.dart';
import 'package:uuid/uuid.dart';

class ToDoListsView extends ConsumerWidget {
  final MyListsModel myList;

  const ToDoListsView({
    super.key,
    required this.myList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myListName = myList.name;
    final myListColor = Color(myList.colorValue);
    final toDoLists = ref.watch(toDoListsProvider(myList.id));

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
            SliverList.separated(
              itemCount: toDoLists.length,
              separatorBuilder: (context, index) {
                return Container(
                  height: 0.4,
                  color: Theme.of(context).dividerColor,
                  margin: const EdgeInsets.only(left: 48.0),
                );
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print(index);
                  },
                  child: Slidable(
                    key: Key(toDoLists[index].id.toString()),
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
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: toDoLists[index].isCompleted
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
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
                          const Gap(12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                toDoLists[index].title,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                toDoLists[index].description,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
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
            final newToDo = ToDoListsModel(
              id: const Uuid().v4(),
              title: 'New To-Do',
              description: 'Description of new to-do',
              date: DateTime.now().toString(),
              time: TimeOfDay.now().format(context),
              isCompleted: false,
              myListId: myList.id,
            );
            ref
                .read(toDoListsProvider(myList.id).notifier)
                .addToDoList(newToDo);
          },
        ),
      ),
    );
  }
}
