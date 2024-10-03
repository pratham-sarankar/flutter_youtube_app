import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_youtube_app/features/feed/domain/use_cases/fetch_feed_use_case.dart';
import 'package:flutter_youtube_app/features/feed/domain/use_cases/fetch_more_feed_use_case.dart';
import 'package:flutter_youtube_app/features/feed/presentation/blocs/feed_bloc/feed_bloc_event.dart';
import 'package:flutter_youtube_app/features/feed/presentation/blocs/feed_bloc/feed_bloc_state.dart';

class FeedBloc extends Bloc<FeedBlocEvent, FeedBlocState> {
  FeedBloc() : super(FeedBlocState()) {
    on<FetchFeedEvent>(fetchFeed, transformer: droppable());
    on<FetchMoreFeedEvent>(fetchMoreFeed, transformer: droppable());
  }

  void fetchFeed(FetchFeedEvent event, Emitter<FeedBlocState> emit) async {
    emit(state.copyWith(isLoading: true));
    final useCase = FetchFeedUseCase();
    final response = await useCase.execute(event.query);
    emit(
      state
          .copyWith(continuationKey: response.continuationKey, isLoading: false)
          .addAll(response.contents),
    );
  }

  void fetchMoreFeed(
      FetchMoreFeedEvent event, Emitter<FeedBlocState> emit) async {
    emit(state.copyWith(isLoadingMore: true));
    final useCase = FetchMoreFeedUseCase();
    final response = await useCase.execute(event.continuationKey);
    emit(state
        .copyWith(
            isLoadingMore: false, continuationKey: response.continuationKey)
        .addAll(response.contents));
  }
}
