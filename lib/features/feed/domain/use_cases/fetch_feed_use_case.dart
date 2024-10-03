import 'package:flutter/foundation.dart';
import 'package:flutter_youtube_app/features/feed/data/remote/data_sources/remote_feed_data_source.dart';
import 'package:flutter_youtube_app/features/feed/domain/repositories/video_feed_repository.dart';
import 'package:flutter_youtube_search/models/response/youtube_search_response.dart';

class FetchFeedUseCase {
  late final VideoFeedRepository repository;

  Future<YoutubeSearchResponse> execute(String query) async {
    repository = RemoteVideoFeedDataSource();
    // final result = await repository.fetchFeed(query);
    final result = await compute(repository.fetchFeed, query);
    print(result.contents.length);
    return result;
  }
}
