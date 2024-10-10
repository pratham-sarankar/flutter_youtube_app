import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_youtube_app/features/topic/data/local/models/topic.dart';
import 'package:flutter_youtube_app/features/topic/presentation/blocs/topic_bloc.dart';
import 'package:flutter_youtube_app/features/topic/presentation/blocs/topic_event.dart';
import 'package:flutter_youtube_app/features/topic/presentation/blocs/topic_state.dart';
import 'package:flutter_youtube_app/features/topic/presentation/widgets/topic_sheet.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({super.key});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late final TopicBloc _topicBloc;

  @override
  void initState() {
    super.initState();
    _topicBloc = TopicBloc()..add(LoadTopicsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("Topics"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () async {
                    await showTopicBottomSheet().closed;
                    _topicBloc.add(LoadTopicsEvent());
                  },
                ),
              ),
            ],
          ),
          SliverFillRemaining(
            child: BlocConsumer(
                bloc: _topicBloc,
                listener: (context, state) {
                  if (state is TopicError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        dismissDirection: DismissDirection.horizontal,
                        behavior: SnackBarBehavior.floating,
                        action: SnackBarAction(
                          label: "Retry",
                          onPressed: () {
                            _topicBloc.add(LoadTopicsEvent());
                          },
                        ),
                      ),
                    );
                  }
                },
                listenWhen: (previous, current) => current is TopicError,
                buildWhen: (previous, current) => current is! TopicError,
                builder: (context, state) {
                  if (state is TopicLoaded) {
                    return ReorderableListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      itemBuilder: (context, index) {
                        final topic = state.topics[index];
                        return ListTile(
                          onTap: () async {
                            await showTopicBottomSheet(topic: topic).closed;
                            _topicBloc.add(LoadTopicsEvent());
                          },
                          key: ValueKey(index),
                          tileColor: index % 2 == 0
                              ? Theme.of(context).colorScheme.surface
                              : Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerLow,
                          horizontalTitleGap: 10,
                          leading: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                            child: Text("${index + 1}"),
                          ),
                          trailing: const Icon(Icons.drag_handle),
                          title: Text(topic.name),
                        );
                      },
                      itemCount: state.topics.length,
                      onReorder: (oldIndex, newIndex) {
                        if (oldIndex < newIndex) {
                          newIndex -= 1;
                        }
                        final topic = state.topics.removeAt(oldIndex);
                        state.topics.insert(newIndex, topic);
                        _topicBloc.add(
                          UpdateTopicsEvent(topics: state.topics),
                        );
                      },
                    );
                  }
                  return Container();
                }),
          )
        ],
      ),
    );
  }

  PersistentBottomSheetController showTopicBottomSheet({Topic? topic}) {
    return scaffoldKey.currentState!.showBottomSheet(
      (context) {
        return TopicSheet(
          topic: topic,
        );
      },
    );
  }
}
