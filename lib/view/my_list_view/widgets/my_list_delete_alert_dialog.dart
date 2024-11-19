import 'package:flutter/material.dart';

class MyListDeleteAlertDialog extends StatelessWidget {
  final String listName;
  final VoidCallback onDelete;

  const MyListDeleteAlertDialog({
    super.key,
    required this.listName,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete list "$listName"?'),
      content: const Text('This will delete all reminders in this list.'),
      titlePadding:
          const EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 12),
      contentPadding: const EdgeInsets.only(left: 24, right: 24),
      actionsPadding: const EdgeInsets.all(12),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
          ),
        ),
        TextButton(
          onPressed: () {
            onDelete();
            Navigator.of(context).pop();
          },
          child: const Text(
            'Delete',
          ),
        ),
      ],
    );
  }
}
