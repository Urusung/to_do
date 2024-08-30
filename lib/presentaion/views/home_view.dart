import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list_riverpod/presentaion/viewmodels/color_picker_provider.dart';

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
                                child: const FaIcon(
                                  FontAwesomeIcons.listUl,
                                  size: 14,
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
                              FaIcon(
                                FontAwesomeIcons.chevronRight,
                                size: 14,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
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
        child: FaIcon(
          FontAwesomeIcons.plus,
          size: 18,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        onPressed: () {
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
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: 84,
                                  height: 84,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(42.0),
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.4),
                                        blurRadius: 12,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: const Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.listUl,
                                      size: 42,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Gap(18),
                                TextField(
                                  cursorColor: Colors.blue,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: 'List Name',
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    contentPadding: const EdgeInsets.only(
                                        left: 0, right: 0), // 커서와 텍스트의 위치를 조정
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.0),
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  onTap: () {
                                    // 텍스트 입력 시 커서가 자동으로 텍스트 바로 앞에 위치하도록 설정
                                    // 필요 시 추가 논리가 들어갈 수 있습니다.
                                  },
                                ),
                              ],
                            ),
                          ),
                          const Gap(16),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            child: const ColorPicker(),
                          )
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: colorList.map(
        (color) {
          return GestureDetector(
            onTap: () {
              ref.read(colorPickerProvider.notifier).selectColor(color);
            },
            child: Container(
              width: 46,
              height: 46,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: selectedColor == color
                    ? Border.all(
                        color: Theme.of(context).colorScheme.onSecondary,
                        width: 3,
                      )
                    : null,
              ),
              child: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
