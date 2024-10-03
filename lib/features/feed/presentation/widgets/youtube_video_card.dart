import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/features/feed/presentation/widgets/thumbnail_widget.dart';
import 'package:flutter_youtube_search/models/youtube_video.dart';
import 'package:google_fonts/google_fonts.dart';

class YoutubeVideoCard extends StatelessWidget {
  const YoutubeVideoCard({super.key, required this.video});
  final YoutubeVideo video;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        ThumbnailWidget(video: video),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  video.channelDetails.thumbnails.last.url,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      video.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: height * 0.02,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      [
                        video.channelDetails.name,
                        video.viewCount.shortText,
                        video.publishedTime
                      ].where((e) => e != null).join(' • '),
                      style: GoogleFonts.poppins(
                        fontSize: height * 0.016,
                        color: Colors.grey.shade800,
                        height: 1.6,
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
  }
}
