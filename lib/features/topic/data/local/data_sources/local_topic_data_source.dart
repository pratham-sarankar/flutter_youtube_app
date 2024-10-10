import 'package:flutter_youtube_app/core/database/sqlite.dart';
import 'package:flutter_youtube_app/features/topic/data/local/models/topic.dart';
import 'package:flutter_youtube_app/features/topic/domain/repositories/topic_respository.dart';

class LocalTopicDataSource extends TopicRepository {
  @override
  Future<void> addTopic(Topic topic) async {
    await SqliteDatabase.instance.database.insert(
      Topic.tableName,
      topic.toMap(),
    );
  }

  @override
  Future<void> deleteTopic(String id) {
    // TODO: implement deleteTopic
    throw UnimplementedError();
  }

  @override
  Future<Topic> getTopic(String id) {
    // TODO: implement getTopic
    throw UnimplementedError();
  }

  @override
  Future<List<Topic>> getTopics() async {
    final data = await SqliteDatabase.instance.database.query(
      Topic.tableName,
      orderBy: 'precedence',
    );
    return data.map((e) => Topic.fromMap(e)).toList();
  }

  @override
  Future<void> updateTopic(Topic topic) async {
    await SqliteDatabase.instance.database.update(
      Topic.tableName,
      topic.toMap(),
      where: 'id = ?',
      whereArgs: [topic.id],
    );
  }

  @override
  Future<void> bulkUpdate(List<Topic> topics) async {
    await SqliteDatabase.instance.database.transaction((txn) async {
      final batch = txn.batch();
      for (final topic in topics) {
        batch.update(
          Topic.tableName,
          topic.toMap(),
          where: 'id = ?',
          whereArgs: [topic.id],
        );
      }
      await batch.commit(noResult: true);
    });
  }
}
