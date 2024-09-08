import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list_riverpod/presentaion/viewmodels/color_picker_provider.dart';
import 'package:to_do_list_riverpod/presentaion/viewmodels/my_lists_provider.dart';
import 'package:to_do_list_riverpod/presentaion/widgets/color_picker.dart';
import 'package:to_do_list_riverpod/presentaion/widgets/list_name_input.dart';

class MyListsView extends ConsumerWidget {
  const MyListsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myLists = ref.watch(myListsProvider);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              child: FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                size: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2.1,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: 4,
                  (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 14,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  child: const FaIcon(
                                    FontAwesomeIcons.listUl,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Today',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                            Text(
                              '0',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Gap(4),
            ),
            myLists.isEmpty
                ? const SliverToBoxAdapter()
                : SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 28, top: 8.0, bottom: 8.0),
                      child: Text(
                        'My Lists',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              sliver: DecoratedSliver(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                sliver: SliverList.separated(
                  itemCount: myLists.length,
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 0.4,
                      color: Theme.of(context).dividerColor,
                      margin: const EdgeInsets.only(left: 48.0),
                    );
                  },
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Slidable(
                        key: Key(myLists[index].id.toString()),
                        endActionPane: ActionPane(
                          motion: const StretchMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                ref
                                    .read(myListsProvider.notifier)
                                    .deleteList(myLists[index]);
                              },
                              borderRadius: index == 0 && myLists.length > 1
                                  ? const BorderRadius.only(
                                      topRight: Radius.circular(8.0),
                                    )
                                  : myLists.length == 1
                                      ? const BorderRadius.only(
                                          topRight: Radius.circular(8.0),
                                          bottomRight: Radius.circular(8.0),
                                        )
                                      : myLists.length - 1 == index
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
                                    backgroundColor:
                                        Color(myLists[index].colorValue),
                                    child: const FaIcon(
                                      FontAwesomeIcons.listUl,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Gap(10),
                                  Text(
                                    myLists[index].name,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '0',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const Gap(8),
                                  FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    size: 14,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        context.pushNamed(
                          'toDoListsView',
                          extra: myLists[index],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 12, right: 16, bottom: 34),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.add_circled_solid,
                    color: Theme.of(context).colorScheme.primary,
                    size: 28,
                  ),
                  const Gap(8),
                  Text(
                    'New To Do List',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ],
              ),
              onTap: () {},
            ),
            GestureDetector(
              child: Text(
                'Add List',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500),
              ),
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18.0),
                          topRight: Radius.circular(18.0),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        appBar: AppBar(
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
                                overlayColor: WidgetStateColor.resolveWith(
                                    (states) => Colors.transparent),
                              ),
                              child: Text(
                                'Cancel',
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          actions: [
                            SizedBox(
                              width: 100,
                              child: Container(
                                padding: const EdgeInsets.only(right: 4.0),
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    overlayColor: WidgetStateColor.resolveWith(
                                        (states) => Colors.transparent),
                                  ),
                                  child: Text(
                                    'Done',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ref.read(myListsProvider.notifier).addList(
                                          'New List',
                                          ref.read(colorPickerProvider).value,
                                        );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        body: const SafeArea(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                ListNameInput(),
                                Gap(16),
                                ColorPicker(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
