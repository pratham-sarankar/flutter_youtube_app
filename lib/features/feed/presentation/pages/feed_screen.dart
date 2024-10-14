import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_youtube_app/features/feed/presentation/blocs/feed_bloc/feed_bloc.dart';
import 'package:flutter_youtube_app/features/feed/presentation/blocs/feed_bloc/feed_bloc_event.dart';
import 'package:flutter_youtube_app/features/feed/presentation/blocs/feed_bloc/feed_bloc_state.dart';
import 'package:flutter_youtube_app/features/feed/presentation/widgets/feed_app_bar.dart';
import 'package:flutter_youtube_app/features/feed/presentation/widgets/youtube_video_card.dart';
import 'package:flutter_youtube_app/features/topic/data/local/models/topic.dart';
import 'package:flutter_youtube_app/features/topic/presentation/blocs/topic_bloc.dart';
import 'package:flutter_youtube_app/features/topic/presentation/blocs/topic_event.dart';
import 'package:flutter_youtube_app/features/topic/presentation/blocs/topic_state.dart';
import 'package:flutter_youtube_search/models/youtube_video.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late final FeedBloc _feedBloc;
  late final ScrollController _scrollController;

  TopicBloc? get _topicBloc =>
      context.mounted ? context.read<TopicBloc>() : null;

  @override
  void initState() {
    super.initState();
    _feedBloc = FeedBloc()..add(FetchFeedEvent(query: "Flutter"));
    _scrollController = ScrollController()..addListener(_scrollEndListener);
  }

  @override
  void dispose() {
    _feedBloc.close();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollEndListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _feedBloc.add(FetchMoreFeedEvent(_feedBloc.state.continuationKey));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<FeedBloc, FeedBlocState>(
        bloc: _feedBloc,
        listener: (context, state) {
          log("FeedBloc: $state");
        },
        builder: (context, state) {
          return SafeArea(
            child: CustomScrollView(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              slivers: [
                BlocConsumer<TopicBloc, TopicState>(
                  listener: (context, state) {
                    if (state is TopicUpdated) {
                      context.read<TopicBloc>().add(LoadTopicsEvent());
                    }
                  },
                  builder: (context, state) {
                    final topics =
                        state is TopicLoaded ? state.topics : <Topic>[];
                    return FeedAppBar(
                      key: UniqueKey(),
                      topics: topics,
                      onSelect: (index, selected) {
                        List<Topic> updatedTopics = topics
                            .map((e) => e.copyWith(isSelected: false))
                            .toList();
                        updatedTopics[index] =
                            topics[index].copyWith(isSelected: selected);
                        context
                            .read<TopicBloc>()
                            .add(UpdateTopicsEvent(topics: updatedTopics));
                      },
                    );
                  },
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.contents.length,
                    (context, index) {
                      final video = state.contents[index];
                      if (video is YoutubeVideo) {
                        return YoutubeVideoCard(video: video);
                      }
                      return Container();
                    },
                  ),
                ),
                if (state.isLoadingMore)
                  const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            CupertinoActivityIndicator(radius: 12),
                            SizedBox(height: 5),
                            Text(
                              "Loading More...",
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
