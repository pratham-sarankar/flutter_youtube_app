abstract class FeedBlocEvent {}

class FetchFeedEvent extends FeedBlocEvent {
  final String query;

  FetchFeedEvent({required this.query});
}

class FetchMoreFeedEvent extends FeedBlocEvent {
  final String? continuationKey;

  FetchMoreFeedEvent(this.continuationKey);
}
