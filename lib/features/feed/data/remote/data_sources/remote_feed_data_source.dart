import 'package:flutter_youtube_app/features/feed/domain/repositories/video_feed_repository.dart';
import 'package:flutter_youtube_search/models/response/youtube_search_response.dart';
import 'package:flutter_youtube_search/youtube_search.dart';

class RemoteVideoFeedDataSource extends VideoFeedRepository {
  @override
  Future<YoutubeSearchResponse> fetchFeed(String query) async {
    return await YoutubeSearch().search(query: query);
  }

  @override
  Future<YoutubeSearchResponse> fetchMoreFeed(String continuationKey) async {
    return await YoutubeSearch().next(continuationKey);
  }
}
