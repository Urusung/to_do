import 'package:flutter/material.dart';

class MyListHeader extends StatelessWidget {
  const MyListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 28, top: 8.0, bottom: 8.0),
        child: Text(
          'My List',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
