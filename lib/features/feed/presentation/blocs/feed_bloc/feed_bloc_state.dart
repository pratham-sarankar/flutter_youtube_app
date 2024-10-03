import 'package:flutter_youtube_search/models/abstract/youtube_content.dart';

class FeedBlocState {
  final List<YoutubeContent> contents;
  final bool isLoading;
  final bool isLoadingMore;
  final String? continuationKey;

  FeedBlocState({
    this.contents = const [],
    this.continuationKey,
    this.isLoading = false,
    this.isLoadingMore = false,
  });

  FeedBlocState addAll(List<YoutubeContent> contents) {
    return copyWith(contents: [...this.contents, ...contents]);
  }

  FeedBlocState copyWith({
    List<YoutubeContent>? contents,
    bool? isLoading,
    bool? isLoadingMore,
    String? continuationKey,
  }) {
    return FeedBlocState(
      contents: contents ?? this.contents,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      continuationKey: continuationKey ?? this.continuationKey,
    );
  }
}
