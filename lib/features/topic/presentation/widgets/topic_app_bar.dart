import 'package:flutter/material.dart';

class TopicAppBar extends StatelessWidget {
  const TopicAppBar({super.key, required this.onAddTopic});
  final VoidCallback onAddTopic;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text("Topics"),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddTopic,
          ),
        ),
      ],
    );
  }
}
