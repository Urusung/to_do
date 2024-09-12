import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:to_do_list_riverpod/data/models/my_lists_model.dart';
import 'package:to_do_list_riverpod/presentaion/viewmodels/color_picker_provider.dart';
import 'package:to_do_list_riverpod/presentaion/viewmodels/list_name_text_editing_controller_provider.dart';
import 'package:to_do_list_riverpod/presentaion/viewmodels/my_lists_provider.dart';
import 'package:uuid/uuid.dart';

class AddNewListView extends ConsumerWidget {
  const AddNewListView({
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
                ListNameTextField(),
                Gap(16),
                ColorPicker(),
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
    final isEmptyListName = ref.watch(isEmptyListNameTextProvider);

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
                    _addList(context, ref);
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

  void _addList(BuildContext context, WidgetRef ref) {
    final isEmptyListNameText = ref.watch(isEmptyListNameTextProvider);
    final selectedColor = ref.watch(colorPickerProvider);

    if (!isEmptyListNameText) {
      final listName = ref.read(listNameTextEditingControllerProvider).text;
      final newList = MyListsModel(
        id: const Uuid().v4(),
        name: listName,
        colorValue: selectedColor.value,
        toDoLists: [],
      );
      ref.read(myListsProvider.notifier).addMyList(newList);
      Navigator.pop(context);
    }
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

class ColorPicker extends ConsumerWidget {
  const ColorPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = ref.watch(colorPickerProvider);
    List<Color> colorList = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.deepPurple,
      Colors.brown,
    ];
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: colorList.map(
          (color) {
            return GestureDetector(
              onTap: () {
                ref.read(colorPickerProvider.notifier).selectColor(color);
              },
              child: Container(
                width: 48,
                height: 48,
                padding: const EdgeInsets.all(3.4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: selectedColor.value == color.value
                      ? Border.all(
                          color: Theme.of(context).colorScheme.onSecondary,
                          width: 3,
                        )
                      : Border.all(
                          color: Theme.of(context).colorScheme.surface,
                          width: 3,
                        ),
                ),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
