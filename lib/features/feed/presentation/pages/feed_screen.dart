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
    return Scaffold(
      // appBar: AppBar(
      //   leadingWidth: 70,
      //   leading: const Padding(
      //     padding: EdgeInsets.only(left: 20),
      //     child: CircleAvatar(
      //       radius: 20,
      //       backgroundImage: NetworkImage(
      //         "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D",
      //       ),
      //     ),
      //   ),
      //   titleSpacing: 12,
      //   title: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         "Welcome Back 👋",
      //         style: GoogleFonts.poppins(
      //           fontSize: 15,
      //           color: Colors.grey.shade800,
      //         ),
      //       ),
      //       Text(
      //         "Pratham Sarankar",
      //         style: GoogleFonts.poppins(
      //           fontSize: 16,
      //           color: Colors.black,
      //           fontWeight: FontWeight.w500,
      //         ),
      //       ),
      //       const SizedBox(height: 4),
      //     ],
      //   ),
      //   centerTitle: false,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 10),
      //       child: IconButton(
      //         icon: const Icon(IconlyLight.search),
      //         onPressed: () {},
      //       ),
      //     ),
      //   ],
      // ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leadingWidth: 70,
              leading: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D",
                  ),
                ),
              ),
              titleSpacing: 12,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back 👋",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  Text(
                    "Pratham Sarankar",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
              centerTitle: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: const Icon(IconlyLight.search),
                    onPressed: () {},
                  ),
                ),
              ],
              floating: true,
              pinned: false,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Image.network(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  fit: BoxFit.cover,
                ),
                title: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: Row(
                    children: [
                      for (int i = 0; i < 15; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: ChoiceChip(
                            label: Text("Flutter $i"),
                            selected: i % 2 == 0,
                            onSelected: (value) {},
                            showCheckmark: false,
                          ),
                        ),
                    ],
                  ),
                ),
                // background: Image.network(
                //   "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                //   fit: BoxFit.cover,
                // ),
                collapseMode: CollapseMode.parallax,
                expandedTitleScale: 1,
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                  StretchMode.blurBackground,
                ],
              ),
            ),
            SliverAppBar(
              leadingWidth: 70,
              leading: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D",
                  ),
                ),
              ),
              titleSpacing: 12,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back 👋",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  Text(
                    "Pratham Sarankar",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
              centerTitle: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: const Icon(IconlyLight.search),
                    onPressed: () {},
                  ),
                ),
              ],
              floating: true,
              pinned: true,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Image.network(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  fit: BoxFit.cover,
                ),
                title: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: Row(
                    children: [
                      for (int i = 0; i < 15; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: ChoiceChip(
                            label: Text("Flutter $i"),
                            selected: i % 2 == 0,
                            onSelected: (value) {},
                            showCheckmark: false,
                          ),
                        ),
                    ],
                  ),
                ),
                // background: Image.network(
                //   "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                //   fit: BoxFit.cover,
                // ),
                collapseMode: CollapseMode.parallax,
                expandedTitleScale: 1,
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                  StretchMode.blurBackground,
                ],
              ),
            ),
          ];
        },
        body: const Text("Hello"),
      ),
      // body: CustomScrollView(
      //   slivers: [
      //
      //     Expanded(
      //       child: ListView(
      //         padding: const EdgeInsets.symmetric(
      //           horizontal: 15,
      //           vertical: 5,
      //         ),
      //         shrinkWrap: true,
      //         children: [
      //           for (int i = 0; i < 10; i++)
      //             Column(
      //               children: [
      //                 AspectRatio(
      //                   aspectRatio: 16 / 9,
      //                   child: ClipRRect(
      //                     borderRadius: BorderRadius.circular(20),
      //                     child: Image.network(
      //                       "https://images.inc.com/uploaded_files/image/1920x1080/getty_470285218_2000133320009280218_277406.jpg",
      //                     ),
      //                   ),
      //                 ),
      //                 const SizedBox(height: 10),
      //                 Row(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     const CircleAvatar(
      //                       radius: 20,
      //                       backgroundImage: NetworkImage(
      //                         "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D",
      //                       ),
      //                     ),
      //                     const SizedBox(width: 10),
      //                     Expanded(
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Text(
      //                             "How to enhance performance, productivity and quality of Flutter apps",
      //                             maxLines: 2,
      //                             overflow: TextOverflow.ellipsis,
      //                             style: GoogleFonts.poppins(
      //                               fontSize: 14,
      //                               color: Colors.black,
      //                               fontWeight: FontWeight.w500,
      //                             ),
      //                           ),
      //                           Text(
      //                             "Budi • 10k views • 2 hours ago",
      //                             style: GoogleFonts.poppins(
      //                               fontSize: 12,
      //                               color: Colors.grey.shade800,
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     // const SizedBox(width: 10),
      //                     // IconButton(
      //                     //   onPressed: () {},
      //                     //   style: ButtonStyle(
      //                     //     padding: WidgetStateProperty.all(
      //                     //       const EdgeInsets.all(0),
      //                     //     ),
      //                     //     iconSize: WidgetStateProperty.all(20),
      //                     //   ),
      //                     //   icon: Icon(Icons.more_vert_rounded),
      //                     // ),
      //                   ],
      //                 ),
      //                 const SizedBox(height: 15),
      //               ],
      //             )
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
