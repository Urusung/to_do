import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list_riverpod/view/my_list_view/riverpod/my_list_provider.dart';
import 'package:to_do_list_riverpod/view/my_list_view/widgets/my_list_delete_alert_dialog.dart';
import 'package:to_do_list_riverpod/view/to_do_list_view/riverpod/to_do_list_provider.dart';

class MyListSliverListWidget extends ConsumerWidget {
  const MyListSliverListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myList = ref.watch(myListProvider);

    return SliverPadding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      sliver: DecoratedSliver(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        sliver: SliverList.separated(
          itemCount: myList.length,
          separatorBuilder: (context, index) {
            return Container(
              height: 0.4,
              color: Theme.of(context).dividerColor,
              margin: const EdgeInsets.only(left: 48.0),
            );
          },
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.pushNamed(
                  'toDoListView',
                  extra: myList[index],
                );
              },
              child: Slidable(
                closeOnScroll: true,
                endActionPane: ActionPane(
                  motion: const StretchMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return MyListDeleteAlertDialog(
                              listName: myList[index].name,
                              onDelete: () {
                                ref
                                    .read(myListProvider.notifier)
                                    .deleteMyList(myList[index].id);
                              },
                            );
                          },
                        );
                      },
                      borderRadius: index == 0 && myList.length > 1
                          ? const BorderRadius.only(
                              topRight: Radius.circular(8.0),
                            )
                          : myList.length == 1
                              ? const BorderRadius.only(
                                  topRight: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                )
                              : myList.length - 1 == index
                                  ? const BorderRadius.only(
                                      bottomRight: Radius.circular(8.0),
                                    )
                                  : BorderRadius.zero,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: Color(myList[index].colorValue),
                            child: const FaIcon(
                              FontAwesomeIcons.listUl,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                          const Gap(10),
                          Text(
                            myList[index].name,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            ref
                                .watch(
                                  toDoListProvider(myList[index].id),
                                )
                                .where((element) => !element.isCompleted)
                                .length
                                .toString(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const Gap(8),
                          FaIcon(
                            FontAwesomeIcons.chevronRight,
                            size: 14,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
