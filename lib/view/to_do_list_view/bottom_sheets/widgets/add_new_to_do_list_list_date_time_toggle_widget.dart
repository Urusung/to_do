import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewToDoListListDateTimeToggleWidget extends StatelessWidget {
  const AddNewToDoListListDateTimeToggleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(left: 16, right: 16),
            leading: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                CupertinoIcons.calendar,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Date',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: Transform.scale(
              scale: 1.1,
              child: CupertinoSwitch(
                value: true,
                onChanged: (value) {},
              ),
            ),
          ),
          Divider(
            indent: 66,
            height: 0.4,
            color: Theme.of(context).dividerColor,
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 16, right: 16),
            leading: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                CupertinoIcons.clock_fill,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Time',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: Transform.scale(
              scale: 1.1,
              child: CupertinoSwitch(
                value: true,
                onChanged: (value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
