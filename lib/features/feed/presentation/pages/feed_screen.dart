import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_youtube_app/features/feed/presentation/blocs/feed_bloc/feed_bloc.dart';
import 'package:flutter_youtube_app/features/feed/presentation/blocs/feed_bloc/feed_bloc_event.dart';
import 'package:flutter_youtube_app/features/feed/presentation/blocs/feed_bloc/feed_bloc_state.dart';
import 'package:flutter_youtube_app/features/feed/presentation/widgets/custom_sliver_header_delegate.dart';
import 'package:flutter_youtube_app/features/feed/presentation/widgets/youtube_video_card.dart';
import 'package:flutter_youtube_search/models/youtube_video.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late final FeedBloc bloc;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    bloc = FeedBloc()..add(FetchFeedEvent(query: "Flutter"));
    scrollController = ScrollController()..addListener(_scrollEndListener);
  }

  @override
  void dispose() {
    bloc.close();
    scrollController.dispose();
    super.dispose();
  }

  void _scrollEndListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      bloc.add(FetchMoreFeedEvent(bloc.state.continuationKey!));
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: BlocConsumer<FeedBloc, FeedBlocState>(
        bloc: bloc,
        listener: (context, state) {
          log("FeedBloc: $state");
        },
        builder: (context, state) {
          return SafeArea(
            child: CustomScrollView(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                  pinned: false,
                  floating: true,
                  delegate: CustomSliverHeaderDelegate(
                    minHeight: height * 0.08,
                    height: height * 0.15,
                  ),
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
