import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_youtube_app/features/topic/domain/use_cases/fetch_topics_use_case.dart';
import 'package:flutter_youtube_app/features/topic/domain/use_cases/update_topics_use_case.dart';
import 'package:flutter_youtube_app/features/topic/presentation/blocs/topic_event.dart';
import 'package:flutter_youtube_app/features/topic/presentation/blocs/topic_state.dart';

class TopicBloc extends Bloc<TopicEvent, TopicState> {
  TopicBloc() : super(TopicInitial()) {
    on<LoadTopicsEvent>(_loadTopics);
    on<UpdateTopicsEvent>(_updateTopics);
  }

  void _loadTopics(LoadTopicsEvent event, Emitter<TopicState> emit) async {
    try {
      emit(TopicLoading());
      final topics = await FetchTopicsUseCase().execute();
      emit(TopicLoaded(topics: topics));
    } on PlatformException catch (e) {
      emit(TopicError(message: "An error occurred"));
    }
  }

  void _updateTopics(UpdateTopicsEvent event, Emitter<TopicState> emit) async {
    // Map the topics to update the precedence equal to the index of the list
    for (int i = 0; i < event.topics.length; i++) {
      event.topics[i] = event.topics[i].copyWith(precedence: i + 1);
    }
    await UpdateTopicsUseCase().execute(event.topics);
    emit(TopicLoaded(topics: event.topics));
  }
}
