import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: false,
              floating: true,
              delegate: CustomSliverHeaderDelegate(
                minHeight: height * 0.08,
                height: height * 0.15,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: Image.network(
                            "https://images.inc.com/uploaded_files/image/1920x1080/getty_470285218_2000133320009280218_277406.jpg",
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              radius: 20,
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
                                    "How to enhance performance, productivity and quality of Flutter apps",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2,
                                    ),
                                  ),
                                  Text(
                                    "Budi • 10k views • 2 hours ago",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // const SizedBox(width: 10),
                            // IconButton(
                            //   onPressed: () {},
                            //   style: ButtonStyle(
                            //     padding: WidgetStateProperty.all(
                            //       const EdgeInsets.all(0),
                            //     ),
                            //     iconSize: WidgetStateProperty.all(20),
                            //   ),
                            //   icon: Icon(Icons.more_vert_rounded),
                            // ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  );
                },
                childCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final double minHeight;

  CustomSliverHeaderDelegate({
    required this.height,
    required this.minHeight,
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
                  for (int i = 0; i < 100; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ChoiceChip(
                        label: Text("Flutter $i"),
                        selected: i % 2 == 0,
                        onSelected: (value) {},
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
                                fontSize: 12,
                                color: Colors.grey.shade800,
                                height: 1.5,
                              ),
                            ),
                            Text(
                              "Pratham Sarankar",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.black,
                                height: 1,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(IconlyLight.search),
                        onPressed: () {},
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
  bool shouldRebuild(covariant CustomSliverHeaderDelegate oldDelegate) {
    return height != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent;
  }
}
