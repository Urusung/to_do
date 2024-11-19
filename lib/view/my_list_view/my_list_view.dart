import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:to_do_list_riverpod/view/my_list_view/riverpod/my_list_provider.dart';
import 'package:to_do_list_riverpod/view/my_list_view/widgets/my_list_category_grid_widget.dart';
import 'package:to_do_list_riverpod/view/my_list_view/widgets/my_list_header_widget.dart';
import 'package:to_do_list_riverpod/view/my_list_view/widgets/my_list_sliver_list_widget.dart';
import 'package:to_do_list_riverpod/view/my_list_view/bottom_sheets/add_new_my_list_bottom_sheet_widget.dart';

class MyListView extends ConsumerWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myList = ref.watch(myListProvider);

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
            const MyListCategoryGridWidget(),
            const SliverToBoxAdapter(
              child: Gap(4),
            ),
            myList.isEmpty ? const SliverToBoxAdapter() : const MyListHeader(),
            const MyListSliverListWidget(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 18, right: 18, bottom: 34, top: 12),
        child: GestureDetector(
          child: Row(
            children: [
              Icon(
                CupertinoIcons.add_circled_solid,
                color: Theme.of(context).colorScheme.primary,
                size: 28,
              ),
              const Gap(8),
              Text(
                'Add List',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return const AddNewMyListBottomSheetWidget();
              },
            );
          },
        ),
      ),
    );
  }
}
