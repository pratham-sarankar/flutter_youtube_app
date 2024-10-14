import 'package:flutter_youtube_app/features/topic/data/local/models/topic.dart';

abstract class TopicEvent {}

class LoadTopicsEvent extends TopicEvent {}

class AddTopicEvent extends TopicEvent {
  final Topic topic;

  AddTopicEvent({required this.topic});
}

class UpdateTopicEvent extends TopicEvent {
  final Topic topic;

  UpdateTopicEvent({required this.topic});
}

class UpdateTopicsEvent extends TopicEvent {
  final List<Topic> topics;

  UpdateTopicsEvent({required this.topics});
}

class DeleteTopicEvent extends TopicEvent {
  final Topic topic;

  DeleteTopicEvent({required this.topic});
}
