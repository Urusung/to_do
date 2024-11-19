import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/data/models/to_do_list_model.dart';
import 'package:to_do_list_riverpod/view/to_do_list_view/riverpod/to_do_list_provider.dart';
import 'package:to_do_list_riverpod/view/to_do_list_view/riverpod/to_do_list_text_editing_controller_provider.dart';
import 'package:uuid/uuid.dart';

class AddNewToDoListAppBarWidget extends ConsumerWidget
    implements PreferredSizeWidget {
  final String myListId;

  const AddNewToDoListAppBarWidget({
    super.key,
    required this.myListId,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEmptyListName = ref.watch(isEmptyTitleTextProvider);

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leadingWidth: 100,
      title: Text(
        'Details',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      leading: Container(
        padding: const EdgeInsets.only(left: 4.0),
        alignment: Alignment.centerLeft,
        child: TextButton(
          style: TextButton.styleFrom(
            overlayColor:
                WidgetStateColor.resolveWith((states) => Colors.transparent),
          ),
          child: Text(
            'Cancel',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w400,
                ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: TextButton(
            style: TextButton.styleFrom(
              overlayColor:
                  WidgetStateColor.resolveWith((states) => Colors.transparent),
            ),
            onPressed: isEmptyListName
                ? null
                : () {
                    addList(context, ref, myListId);
                  },
            child: Text(
              'Done',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: isEmptyListName
                        ? Theme.of(context).colorScheme.tertiaryContainer
                        : Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  void addList(BuildContext context, WidgetRef ref, myListId) {
    final newToDo = ToDoListModel(
      id: const Uuid().v4(),
      title: ref.read(titleTextEditingControllerProvider).text,
      description: ref.read(noteTextEditingControllerProvider).text,
      isCompleted: false,
      myListId: myListId,
    );
    ref.read(toDoListProvider(myListId).notifier).addToDoList(newToDo);
    Navigator.pop(context);
  }
}
