import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:to_do_list_riverpod/data/models/my_list_model.dart';
import 'package:to_do_list_riverpod/view/my_list_view/bottom_sheets/widgets/color_picker_widget.dart';
import 'package:to_do_list_riverpod/view/my_list_view/bottom_sheets/widgets/list_name_text_field_widget.dart';
import 'package:to_do_list_riverpod/view/my_list_view/riverpod/color_picker_provider.dart';
import 'package:to_do_list_riverpod/view/my_list_view/riverpod/my_list_text_editing_controller_provider.dart';
import 'package:to_do_list_riverpod/view/my_list_view/riverpod/my_list_provider.dart';
import 'package:uuid/uuid.dart';

class AddNewMyListBottomSheet extends ConsumerWidget {
  const AddNewMyListBottomSheet({
    super.key,
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
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AddNewListAppBar(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                ListNameTextFieldWidget(),
                Gap(16),
                ColorPickerWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddNewListAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const AddNewListAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEmptyListName = ref.watch(isEmptyMyListNameTextProvider);

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leadingWidth: 100,
      title: Text(
        'New List',
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
                    addList(context, ref);
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

  void addList(BuildContext context, WidgetRef ref) {
    final isEmptyListNameText = ref.watch(isEmptyMyListNameTextProvider);
    final selectedColor = ref.watch(colorPickerProvider);

    if (!isEmptyListNameText) {
      final listName = ref.read(myListNameTextEditingControllerProvider).text;
      final newList = MyListModel(
        id: const Uuid().v4(),
        name: listName,
        colorValue: selectedColor.value,
        toDoList: [],
      );
      ref.read(myListProvider.notifier).addMyList(newList);
      Navigator.pop(context);
    }
  }
}
