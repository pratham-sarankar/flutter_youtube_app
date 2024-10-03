import 'package:flutter/material.dart';
import 'package:flutter_youtube_search/models/youtube_video.dart';

class ThumbnailWidget extends StatelessWidget {
  const ThumbnailWidget({super.key, required this.video});
  final YoutubeVideo video;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Image.network(
          video.thumbnails.last.url,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
