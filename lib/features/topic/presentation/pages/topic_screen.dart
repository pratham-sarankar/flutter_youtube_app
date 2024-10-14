import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_youtube_app/core/utils/snackbar.dart';
import 'package:flutter_youtube_app/features/topic/data/local/models/topic.dart';
import 'package:flutter_youtube_app/features/topic/presentation/blocs/topic_bloc.dart';
import 'package:flutter_youtube_app/features/topic/presentation/blocs/topic_event.dart';
import 'package:flutter_youtube_app/features/topic/presentation/blocs/topic_state.dart';
import 'package:flutter_youtube_app/features/topic/presentation/widgets/topic_app_bar.dart';
import 'package:flutter_youtube_app/features/topic/presentation/widgets/topic_confirm_delete_dialog.dart';
import 'package:flutter_youtube_app/features/topic/presentation/widgets/topic_sheet.dart';
import 'package:flutter_youtube_app/features/topic/presentation/widgets/topics_empty_widget.dart';
import 'package:iconly/iconly.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({super.key});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  TopicBloc? get _bloc => context.mounted ? context.read<TopicBloc>() : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: CustomScrollView(
        slivers: [
          TopicAppBar(
            onAddTopic: () async {
              await _showTopicBottomSheet().closed;
              _bloc?.add(LoadTopicsEvent());
            },
          ),
          SliverFillRemaining(
            child: BlocConsumer<TopicBloc, TopicState>(
              listener: _topicBlocListener,
              buildWhen: _shouldRebuild,
              builder: (context, state) {
                if (state is TopicLoaded) {
                  if (state.topics.isEmpty) {
                    return const TopicsEmptyWidget();
                  }
                  return ReorderableListView.builder(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    itemBuilder: (context, index) {
                      final topic = state.topics[index];
                      return Dismissible(
                        key: ValueKey(topic.id),
                        direction: DismissDirection.horizontal,
                        background: Container(
                          color: Theme.of(context).colorScheme.tertiaryFixed,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
                          child: Icon(
                            IconlyLight.edit,
                            color:
                                Theme.of(context).colorScheme.onTertiaryFixed,
                          ),
                        ),
                        secondaryBackground: Container(
                          color: Theme.of(context).colorScheme.error,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(
                            IconlyLight.delete,
                            color: Theme.of(context).colorScheme.onError,
                          ),
                        ),
                        onDismissed: (direction) async {
                          _onDismiss(direction, topic);
                        },
                        confirmDismiss: (direction) {
                          return _confirmDismiss(direction, topic);
                        },
                        child: ListTile(
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
                        ),
                      );
                    },
                    itemCount: state.topics.length,
                    onReorder: (oldIndex, newIndex) {
                      _reorderTopics(oldIndex, newIndex, state.topics);
                    },
                  );
                }
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }

  bool _shouldRebuild(TopicState previous, TopicState current) {
    return current is! TopicError;
  }

  void _reorderTopics(int oldIndex, int newIndex, List<Topic> topics) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final topic = topics.removeAt(oldIndex);
    topics.insert(newIndex, topic);
    _bloc?.add(UpdateTopicsEvent(topics: topics));
  }

  /// If the state is [TopicError], we show a [SnackBar] with the error message.
  /// Else if the state is [TopicAdded], we show a [SnackBar] with the message "Topic Added Successfully".
  /// Else if the state is [TopicDeleted], we show a [SnackBar] with the message "Topic deleted" and add the [LoadTopicsEvent].
  void _topicBlocListener(BuildContext context, TopicState state) {
    if (state is TopicError) {
      showErrorSnackBar(context, message: state.message);
    } else if (state is TopicDeleted) {
      showSnackBar(context, message: "Topic deleted");
      _bloc?.add(LoadTopicsEvent());
    } else if (state is TopicAdded) {
      showSnackBar(context, message: "Topic Added Successfully");
    }
  }

  PersistentBottomSheetController _showTopicBottomSheet({Topic? topic}) {
    return scaffoldKey.currentState!.showBottomSheet(
      (context) => TopicSheet(topic: topic),
    );
  }

  /// For [DismissDirection.startToEnd], we show a [TopicSheet] to edit the topic and confirm that we don't want to dismiss by returning false.
  /// For [DismissDirection.endToStart], we show a [TopicConfirmDeleteDialog] to seek confirmation from user to delete/dismiss and return the response.
  Future<bool?> _confirmDismiss(DismissDirection direction, Topic topic) async {
    if (direction == DismissDirection.startToEnd) {
      await _showTopicBottomSheet(topic: topic).closed;
      _bloc?.add(LoadTopicsEvent());
      return false;
    } else if (direction == DismissDirection.endToStart) {
      final result = await showDialog(
        context: context,
        builder: (context) => const TopicConfirmDeleteDialog(),
      );
      return result is bool ? result : false;
    }
    return true;
  }

  /// When the [DismissDirection] is [DismissDirection.endToStart] and the user confirms the deletion of the topic, [_onDismiss] function is called.
  void _onDismiss(DismissDirection direction, Topic topic) async {
    _bloc?.add(DeleteTopicEvent(topic: topic));
  }
}
