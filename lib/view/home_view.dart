import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list_riverpod/view_model/go_router_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(19.0),
              child: Image.network(
                'https://img.vogue.co.kr/vogue/2024/01/style_65b0d1d9cf264-1400x1400.jpeg',
                width: 38,
                height: 38,
                fit: BoxFit.fill,
              ),
            ),
            const Gap(12),
            Text(
              '최우성',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              child: Icon(
                CupertinoIcons.search,
                size: 28,
                color: Theme.of(context).colorScheme.primary,
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: CustomScrollView(
            slivers: [
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 1,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: 4,
                  (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 8, top: 8.0, bottom: 8.0),
                  child: Text(
                    '나의 목록',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              DecoratedSliver(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18.0),
                ),
                sliver: SliverList.separated(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.pushNamed('to_do_list_view');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 14,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  child: const Icon(
                                    CupertinoIcons.list_bullet,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                const Gap(8),
                                Text(
                                  'To Do $index',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                Text('2'),
                                Icon(CupertinoIcons.chevron_right)
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 0.1,
                      color: Colors.black,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: Icon(
          Icons.add,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor:
                Theme.of(context).colorScheme.surfaceContainerHighest,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            builder: (BuildContext context) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leadingWidth: 100,
                  leading: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        overlayColor: WidgetStateColor.resolveWith(
                            (states) => Colors.transparent),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                  actions: [
                    SizedBox(
                      width: 100,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            overlayColor: WidgetStateColor.resolveWith(
                                (states) => Colors.transparent),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Done',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                  title: Text(
                    'To Do',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                body: SafeArea(
                  child: Container(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
