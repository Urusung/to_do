import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_riverpod/view/to_do_list_view/riverpod/to_do_list_text_editing_controller_provider.dart';

class AddNewToDoListTitleNotesTextFieldWidget extends ConsumerWidget {
  const AddNewToDoListTitleNotesTextFieldWidget({
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
