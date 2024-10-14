import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class TopicsEmptyWidget extends StatelessWidget {
  const TopicsEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: kToolbarHeight,
          right: size.width * 0.1,
          left: size.width * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              IconlyLight.paper,
              size: size.width * 0.18,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 8),
            Text(
              "No topics found",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              "Add a new topic to get started. Tap the + button, then enter the topic name and tap the save button.",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
