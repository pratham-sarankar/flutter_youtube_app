import 'package:flutter_youtube_app/features/topic/data/local/models/topic.dart';

abstract class TopicRepository {
  Future<List<Topic>> getTopics();
  Future<Topic> getTopic(String id);
  Future<void> addTopic(Topic topic);
  Future<void> updateTopic(Topic topic);
  Future<void> deleteTopic(String id);
  Future<void> bulkUpdate(List<Topic> topics);
}
