import 'package:flutter/material.dart';

class TopicConfirmDeleteDialog extends StatelessWidget {
  const TopicConfirmDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Delete Topic",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      content: Text(
        "Are you sure you want to delete this topic?",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text("Delete"),
        ),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
