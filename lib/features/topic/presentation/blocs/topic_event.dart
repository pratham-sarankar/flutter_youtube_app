import 'package:flutter_youtube_app/features/topic/data/local/models/topic.dart';

abstract class TopicEvent {}

class LoadTopicsEvent extends TopicEvent {}

class UpdateTopicsEvent extends TopicEvent {
  final List<Topic> topics;

  UpdateTopicsEvent({required this.topics});
}
