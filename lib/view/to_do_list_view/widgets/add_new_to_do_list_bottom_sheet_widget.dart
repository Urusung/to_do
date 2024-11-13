import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:to_do_list_riverpod/data/models/to_do_lists_model.dart';
import 'package:to_do_list_riverpod/view/to_do_list_view/riverpod/to_do_list_text_editing_controller_provider.dart';
import 'package:to_do_list_riverpod/view/to_do_list_view/riverpod/to_do_list_provider.dart';
import 'package:uuid/uuid.dart';

class AddNewToDoListBottomSheetWidget extends ConsumerWidget {
  final String myListId;

  const AddNewToDoListBottomSheetWidget({
    super.key,
    required this.myListId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.9,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AddNewListAppBar(
          myListId: myListId,
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TitleNotesTextFieldContainer(),
                Gap(18),
                DateTimeToggleContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddNewListAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String myListId;

  const AddNewListAppBar({
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
    final newToDo = ToDoListsModel(
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

class TitleNotesTextFieldContainer extends ConsumerWidget {
  const TitleNotesTextFieldContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleNameFocusNode = ref.watch(titleFocusNodeProvider);
    final titleTextEditingController =
        ref.watch(titleTextEditingControllerProvider);
    final notesTextEditingController =
        ref.watch(noteTextEditingControllerProvider);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Column(
        children: [
          TextField(
            controller: titleTextEditingController,
            focusNode: titleNameFocusNode,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                top: 16,
                left: 16,
                bottom: 16,
              ),
              hintText: 'Title',
              border: InputBorder.none,
              hintStyle: Theme.of(context).textTheme.labelMedium,
            ),
            onChanged: (value) {
              ref.read(isEmptyTitleTextProvider.notifier).state = value.isEmpty;
            },
          ),
          Divider(
            indent: 16,
            height: 0.4,
            color: Theme.of(context).dividerColor,
          ),
          TextField(
            controller: notesTextEditingController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                top: 16,
                left: 16,
                bottom: 16,
              ),
              hintText: 'Notes',
              border: InputBorder.none,
              hintStyle: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class DateTimeToggleContainer extends StatelessWidget {
  const DateTimeToggleContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(left: 16, right: 16),
            leading: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                CupertinoIcons.calendar,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Date',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: Transform.scale(
              scale: 1.1,
              child: CupertinoSwitch(
                value: true,
                onChanged: (value) {},
              ),
            ),
          ),
          Divider(
            indent: 66,
            height: 0.4,
            color: Theme.of(context).dividerColor,
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 16, right: 16),
            leading: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                CupertinoIcons.clock_fill,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Time',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: Transform.scale(
              scale: 1.1,
              child: CupertinoSwitch(
                value: true,
                onChanged: (value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
