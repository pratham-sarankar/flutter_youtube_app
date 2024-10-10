import 'package:flutter_youtube_app/features/topic/data/local/models/topic.dart';

abstract class TopicState {}

class TopicInitial extends TopicState {}

class TopicLoading extends TopicState {}

class TopicLoaded extends TopicState {
  final List<Topic> topics;

  TopicLoaded({
    required this.topics,
  });
}

class TopicError extends TopicState {
  final String message;

  TopicError({
    required this.message,
  });
}
