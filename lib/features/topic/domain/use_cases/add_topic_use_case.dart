import 'package:flutter_youtube_app/features/topic/data/local/data_sources/local_topic_data_source.dart';
import 'package:flutter_youtube_app/features/topic/data/local/models/topic.dart';
import 'package:flutter_youtube_app/features/topic/domain/repositories/topic_respository.dart';

class AddTopicUseCase {
  final TopicRepository repository = LocalTopicDataSource();

  Future<void> execute(Topic topic) {
    return repository.addTopic(topic);
  }
}
