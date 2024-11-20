import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:to_do_list_riverpod/data/models/my_list_model.dart';
import 'package:to_do_list_riverpod/view/to_do_list_view/bottom_sheets/add_new_to_do_list_bottom_sheet.dart';
import 'package:to_do_list_riverpod/view/to_do_list_view/widgets/to_do_list_cupertino_sliver_navigation_bar_widget.dart';
import 'package:to_do_list_riverpod/view/to_do_list_view/widgets/to_do_list_sliver_list_widget.dart';

class ToDoListView extends ConsumerWidget {
  final MyListModel myList;

  const ToDoListView({
    super.key,
    required this.myList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myListName = myList.name;
    final myListColor = Color(myList.colorValue);
    final myListId = myList.id;

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
            ToDoListCupertinoSliverNavigationBarWidget(
              myListName: myListName,
              myListColor: myListColor,
            ),
            ToDoListSliverListWidget(
              myList: myList,
            ),
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
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return AddNewToDoListBottomSheet(
                  myListId: myListId,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
