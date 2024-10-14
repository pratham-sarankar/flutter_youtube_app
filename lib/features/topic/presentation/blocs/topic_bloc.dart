import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_youtube_app/features/topic/domain/use_cases/add_topic_use_case.dart';
import 'package:flutter_youtube_app/features/topic/domain/use_cases/delete_topic_use_case.dart';
import 'package:flutter_youtube_app/features/topic/domain/use_cases/fetch_topics_use_case.dart';
import 'package:flutter_youtube_app/features/topic/domain/use_cases/update_topic_use_case.dart';
import 'package:flutter_youtube_app/features/topic/domain/use_cases/update_topics_use_case.dart';
import 'package:flutter_youtube_app/features/topic/presentation/blocs/topic_event.dart';
import 'package:flutter_youtube_app/features/topic/presentation/blocs/topic_state.dart';

class TopicBloc extends Bloc<TopicEvent, TopicState> {
  TopicBloc() : super(TopicInitial()) {
    on<LoadTopicsEvent>(_loadTopics, transformer: droppable());
    on<AddTopicEvent>(_addTopic, transformer: droppable());
    on<UpdateTopicEvent>(_updateTopic, transformer: droppable());
    on<UpdateTopicsEvent>(_updateTopics, transformer: droppable());
    on<DeleteTopicEvent>(_deleteTopic, transformer: droppable());
  }

  void _loadTopics(LoadTopicsEvent event, Emitter<TopicState> emit) async {
    try {
      emit(TopicLoading());
      final topics = await FetchTopicsUseCase().execute();
      emit(TopicLoaded(topics: topics));
    } on PlatformException catch (e) {
      emit(TopicError(message: e.message ?? "An error occurred"));
    } catch (e) {
      emit(TopicError(message: "An error occurred"));
    }
  }

  void _addTopic(AddTopicEvent event, Emitter<TopicState> emit) async {
    try {
      await AddTopicUseCase().execute(event.topic);
      emit(TopicAdded());
    } catch (e) {
      emit(TopicError(message: "An error occurred"));
    }
  }

  void _updateTopic(UpdateTopicEvent event, Emitter<TopicState> emit) async {
    try {
      await UpdateTopicUseCase().execute(event.topic);
      emit(TopicUpdated());
    } catch (e) {
      emit(TopicError(message: "An error occurred"));
    }
  }

  void _updateTopics(UpdateTopicsEvent event, Emitter<TopicState> emit) async {
    try {
      // Map the topics to update the precedence equal to the index of the list
      for (int i = 0; i < event.topics.length; i++) {
        event.topics[i] = event.topics[i].copyWith(precedence: i + 1);
      }
      await UpdateTopicsUseCase().execute(event.topics);
      emit(TopicLoaded(topics: event.topics));
    } catch (e) {
      emit(TopicError(message: "An error occurred"));
    }
  }

  void _deleteTopic(DeleteTopicEvent event, Emitter<TopicState> emit) async {
    try {
      assert(event.topic.id != null, "Topic id must not be null");
      await DeleteTopicUseCase().execute(event.topic.id!);
      emit(TopicDeleted());
    } catch (e) {
      emit(TopicError(message: "An error occurred"));
    }
  }
}
