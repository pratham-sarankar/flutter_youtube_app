import 'package:flutter_youtube_app/features/feed/data/remote/data_sources/remote_feed_data_source.dart';
import 'package:flutter_youtube_app/features/feed/domain/repositories/video_feed_repository.dart';
import 'package:flutter_youtube_search/models/response/youtube_search_response.dart';

class FetchMoreFeedUseCase {
  late final VideoFeedRepository repository;

  Future<YoutubeSearchResponse> execute(String continuationKey) async {
    repository = RemoteVideoFeedDataSource();
    final result = await repository.fetchMoreFeed(continuationKey);
    print(result.contents.length);
    return result;
  }
}
