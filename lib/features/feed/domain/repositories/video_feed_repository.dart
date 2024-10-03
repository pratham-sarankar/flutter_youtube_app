import 'package:flutter_youtube_search/models/response/youtube_search_response.dart';

abstract class VideoFeedRepository {
  Future<YoutubeSearchResponse> fetchFeed(String query);
  Future<YoutubeSearchResponse> fetchMoreFeed(String continuationKey);
}
