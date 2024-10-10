import 'package:flutter_youtube_app/features/topic/data/local/data_sources/local_topic_data_source.dart';
import 'package:flutter_youtube_app/features/topic/data/local/models/topic.dart';
import 'package:flutter_youtube_app/features/topic/domain/repositories/topic_respository.dart';

class UpdateTopicUseCase {
  final TopicRepository topicRepository = LocalTopicDataSource();

  UpdateTopicUseCase();

  Future<void> execute(Topic topic) async {
    return topicRepository.updateTopic(topic);
  }
}
