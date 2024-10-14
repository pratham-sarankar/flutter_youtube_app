import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/features/topic/data/local/models/topic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class FeedAppBar extends StatelessWidget {
  const FeedAppBar({super.key, required this.topics, required this.onSelect});
  final List<Topic> topics;
  final Function(int, bool) onSelect;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return SliverPersistentHeader(
      pinned: false,
      floating: true,
      delegate: FeedAppBarDelegate(
        minHeight: height * 0.08,
        height: height * 0.15,
        topics: topics,
        onSelect: onSelect,
      ),
    );
  }
}

class FeedAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final double minHeight;
  final List<Topic> topics;
  final Function(int, bool) onSelect;
  FeedAppBarDelegate({
    required this.height,
    required this.minHeight,
    required this.topics,
    required this.onSelect,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final space = (height - minHeight) * 0.4;
    final progress = shrinkOffset / space;
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            height: height - minHeight,
            child: Opacity(
              opacity: (1 - progress).clamp(0, 1),
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 0,
                ),
                children: [
                  for (int i = 0; i < topics.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                      ),
                      child: ChoiceChip(
                        label: FittedBox(child: Text(topics[i].name)),
                        padding: EdgeInsets.symmetric(
                          horizontal: height * 0.12,
                          vertical: (height - minHeight) * 0.16,
                        ),
                        selected: topics[i].isSelected,
                        onSelected: (value) {
                          onSelect(i, value);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back 👋",
                              style: GoogleFonts.poppins(
                                fontSize: height * 0.12,
                                color: Colors.grey.shade800,
                                height: 1.5,
                              ),
                            ),
                            Text(
                              "Pratham Sarankar",
                              style: GoogleFonts.poppins(
                                fontSize: height * 0.15,
                                color: Colors.black,
                                height: 1,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                          ],
                        ),
                      ),
                      SearchAnchor(
                        builder: (context, controller) {
                          return IconButton(
                            icon: const Icon(IconlyLight.search),
                            onPressed: () {
                              controller.openView();
                            },
                          );
                        },
                        viewLeading: IconButton(
                          icon: const Icon(IconlyLight.arrow_left),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        suggestionsBuilder: (context, controller) {
                          return [
                            const ListTile(
                              title: Text("Flutter"),
                            ),
                            const ListTile(
                              title: Text("Dart"),
                            ),
                          ];
                        },
                        isFullScreen: true,
                        viewBackgroundColor:
                            Theme.of(context).colorScheme.surface,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant FeedAppBarDelegate oldDelegate) {
    return height != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent;
  }
}
