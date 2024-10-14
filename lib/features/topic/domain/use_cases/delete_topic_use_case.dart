import 'package:flutter_youtube_app/features/topic/data/local/data_sources/local_topic_data_source.dart';
import 'package:flutter_youtube_app/features/topic/domain/repositories/topic_respository.dart';

class DeleteTopicUseCase {
  final TopicRepository topicRepository = LocalTopicDataSource();

  Future<void> execute(int id) async {
    await topicRepository.deleteTopic(id);
  }
}
