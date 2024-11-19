import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:to_do_list_riverpod/view/my_list_view/riverpod/color_picker_provider.dart';
import 'package:to_do_list_riverpod/view/my_list_view/riverpod/my_list_text_editing_controller_provider.dart';

class ListNameTextFieldWidget extends ConsumerWidget {
  const ListNameTextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = ref.watch(colorPickerProvider);
    final listNameFocusNode = ref.watch(myListNameFocusNodeProvider);
    final listNameTextEditingController =
        ref.watch(myListNameTextEditingControllerProvider);
    final isEmptyListName = ref.watch(isEmptyMyListNameTextProvider);

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
                        ref.read(isEmptyMyListNameTextProvider.notifier).state =
                            true;
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
              ref.read(isEmptyMyListNameTextProvider.notifier).state =
                  value.isEmpty;
            },
          ),
        ],
      ),
    );
  }
}
