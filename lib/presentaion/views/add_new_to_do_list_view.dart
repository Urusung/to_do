import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:to_do_list_riverpod/data/models/to_do_lists_model.dart';
import 'package:to_do_list_riverpod/presentaion/viewmodels/color_picker_provider.dart';
import 'package:to_do_list_riverpod/presentaion/viewmodels/list_name_text_editing_controller_provider.dart';
import 'package:to_do_list_riverpod/presentaion/viewmodels/to_do_lists_provider.dart';
import 'package:uuid/uuid.dart';

class AddNewToDoListView extends ConsumerWidget {
  final String myListId;

  const AddNewToDoListView({
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  child: Column(
                    children: [
                      TextField(
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
                      ),
                      Divider(
                        indent: 16,
                        height: 0.4,
                        color: Theme.of(context).dividerColor,
                      ),
                      TextField(
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
                ),
                const Gap(18),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding:
                            const EdgeInsets.only(left: 16, right: 16),
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
                        contentPadding:
                            const EdgeInsets.only(left: 16, right: 16),
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
                ),
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
    const isEmptyListName = false;

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
                    _addList(context, ref, myListId);
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

  void _addList(BuildContext context, WidgetRef ref, myListId) {
    final newToDo = ToDoListsModel(
      id: const Uuid().v4(),
      title: 'New To-Do',
      description: 'Description of new to-do',
      date: DateTime.now().toString(),
      time: TimeOfDay.now().format(context),
      isCompleted: false,
      myListId: myListId,
    );
    ref.read(toDoListsProvider(myListId).notifier).addToDoList(newToDo);
    Navigator.pop(context);
  }
}

class ListNameTextField extends ConsumerWidget {
  const ListNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = ref.watch(colorPickerProvider);
    final listNameFocusNode = ref.watch(listNameFocusNodeProvider);
    final listNameTextEditingController =
        ref.watch(listNameTextEditingControllerProvider);
    final isEmptyListName = ref.watch(isEmptyListNameTextProvider);

    Future.delayed(const Duration(milliseconds: 500), () {
      listNameFocusNode.requestFocus();
    });

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Column(
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(44.0),
              color: selectedColor,
              boxShadow: [
                BoxShadow(
                  color: selectedColor.withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.listUl,
                size: 44,
                color: Colors.white,
              ),
            ),
          ),
          const Gap(18),
          TextField(
            controller: listNameTextEditingController,
            focusNode: listNameFocusNode,
            cursorColor: selectedColor,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 20,
                  color: selectedColor,
                ),
            decoration: InputDecoration(
              hintText: 'List Name',
              hintStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.onTertiary,
              contentPadding: const EdgeInsets.all(14),
              suffixIcon: isEmptyListName
                  ? null
                  : GestureDetector(
                      onTap: () {
                        listNameTextEditingController.clear();
                      },
                      child: Icon(
                        CupertinoIcons.clear_circled_solid,
                        color: Theme.of(context).colorScheme.tertiaryFixed,
                      ),
                    ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              ref.read(isEmptyListNameTextProvider.notifier).state =
                  value.isEmpty;
            },
          ),
        ],
      ),
    );
  }
}
