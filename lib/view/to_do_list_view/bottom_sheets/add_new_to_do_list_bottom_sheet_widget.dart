import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:to_do_list_riverpod/view/to_do_list_view/bottom_sheets/widgets/add_new_to_do_list_app_bar_widget.dart';
import 'package:to_do_list_riverpod/view/to_do_list_view/bottom_sheets/widgets/add_new_to_do_list_title_notes_text_field_widget.dart';
import 'package:to_do_list_riverpod/view/to_do_list_view/bottom_sheets/widgets/add_new_to_do_list_list_date_time_toggle_widget.dart';

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
        appBar: AddNewToDoListAppBarWidget(
          myListId: myListId,
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                AddNewToDoListTitleNotesTextFieldWidget(),
                Gap(18),
                AddNewToDoListListDateTimeToggleWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
