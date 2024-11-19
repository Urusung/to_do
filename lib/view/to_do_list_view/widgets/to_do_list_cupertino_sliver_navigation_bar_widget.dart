import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ToDoListCupertinoSliverNavigationBarWidget extends StatelessWidget {
  const ToDoListCupertinoSliverNavigationBarWidget({
    super.key,
    required this.myListName,
    required this.myListColor,
  });

  final String myListName;
  final Color myListColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      alwaysShowMiddle: false,
      backgroundColor: Theme.of(context).canvasColor,
      border: const Border(),
      leading: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: Container(
          width: 28,
          color: Colors.transparent,
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
        ),
      ),
      middle: Text(
        myListName,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: myListColor),
      ),
      largeTitle: Text(
        myListName,
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: myListColor),
      ),
    );
  }
}
