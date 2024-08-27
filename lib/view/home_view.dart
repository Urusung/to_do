import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
              style: Theme.of(context).textTheme.headlineMedium,
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
                    return GestureDetector(
                      onTap: () {
                        print('index: $index');
                      },
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
                                  child: const Icon(
                                    CupertinoIcons.list_bullet,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                const Gap(4),
                                Text(
                                  '오늘',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                            Text(
                              '1',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 26),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SliverToBoxAdapter(
                child: Gap(12),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 8, top: 8.0, bottom: 8.0),
                  child: Text(
                    'My Lists',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
              SliverList.separated(
                itemCount: 3,
                separatorBuilder: (context, index) {
                  return Container(
                    height: 0.4,
                    color: Theme.of(context).dividerColor,
                    margin: const EdgeInsets.only(
                      left: 48.0,
                    ),
                  );
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed('to_do_list_view');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: index == 0
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              )
                            : index == 2
                                ? const BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0),
                                  )
                                : null,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      padding: const EdgeInsets.all(12),
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
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '2',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Gap(4),
                              Icon(
                                CupertinoIcons.chevron_right,
                                size: 16,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: Icon(
          Icons.add,
          color: Theme.of(context).canvasColor,
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Theme.of(context).dialogBackgroundColor,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            builder: (BuildContext context) {
              return SizedBox(
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
                  ),
                  body: SafeArea(
                    child: Container(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
