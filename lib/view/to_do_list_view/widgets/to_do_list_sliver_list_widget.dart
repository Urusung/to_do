import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:to_do_list_riverpod/data/models/my_list_model.dart';
import 'package:to_do_list_riverpod/view/to_do_list_view/riverpod/to_do_list_provider.dart';

class ToDoListSliverListWidget extends ConsumerWidget {
  const ToDoListSliverListWidget({super.key, required this.myList});

  final MyListModel myList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toDoList = ref.watch(toDoListProvider(myList.id));
    final visibleToDoList =
        toDoList.where((item) => !item.isCompleted).toList();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: visibleToDoList.length,
        (context, index) {
          return Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    ref
                        .read(toDoListProvider(myList.id).notifier)
                        .deleteToDoList(visibleToDoList[index].id);
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
                          ref
                              .read(toDoListProvider(myList.id).notifier)
                              .completeToDoList(
                                visibleToDoList[index].id,
                                visibleToDoList[index].isCompleted ? 0 : 1,
                              );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            width: 18,
                            height: 18,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                width: 1.4,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: visibleToDoList[index].isCompleted
                                    ? Colors.red
                                    : Colors.transparent,
                                shape: BoxShape.circle,
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
                            visibleToDoList[index].title,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          visibleToDoList[index].description.isEmpty
                              ? const SizedBox()
                              : Text(
                                  visibleToDoList[index].description,
                                  style: Theme.of(context).textTheme.bodyMedium,
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
    );
  }
}
