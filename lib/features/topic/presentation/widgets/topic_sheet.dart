import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_youtube_app/features/topic/data/local/models/topic.dart';
import 'package:flutter_youtube_app/features/topic/presentation/blocs/topic_bloc.dart';
import 'package:flutter_youtube_app/features/topic/presentation/blocs/topic_event.dart';
import 'package:flutter_youtube_app/features/topic/presentation/pages/topic_screen.dart';

/// [TopicSheet] is a [StatefulWidget] to edit or add a new topic based on the [topic] parameter.
/// It will add an event to the [TopicBloc] to update or add the topic and close the sheet without waiting for the response.
/// The response is handled by [TopicScreen] which has a listener to the [TopicBloc].
class TopicSheet extends StatefulWidget {
  const TopicSheet({super.key, this.topic});
  final Topic? topic;
  @override
  State<TopicSheet> createState() => _TopicSheetState();
}

class _TopicSheetState extends State<TopicSheet> {
  Topic? topic;
  late bool isLoading;
  late final GlobalKey<FormState> formKey;

  TopicBloc? get _bloc => context.mounted ? context.read<TopicBloc>() : null;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    topic = widget.topic;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Material(
      type: MaterialType.card,
      color: Theme.of(context).colorScheme.surfaceContainerLowest,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        side: BorderSide(
          strokeAlign: BorderSide.strokeAlignOutside,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 18,
          bottom: 25,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "${isEditing ? "Edit" : "Add"} Topic",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 14),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: TextFormField(
                  autofocus: true,
                  initialValue: topic?.name,
                  onSaved: (value) {
                    if (topic == null) {
                      topic =
                          Topic(name: value!, precedence: 0, isSelected: false);
                    } else {
                      topic = topic?.copyWith(name: value);
                    }
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Topic name cannot be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Topic Name",
                    hintText: "Enter the topic name",
                    border: InputBorder.none,
                    fillColor:
                        Theme.of(context).colorScheme.surfaceContainerLow,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  if (!(formKey.currentState?.validate() ?? false)) return;
                  formKey.currentState?.save();
                  setState(() {
                    isLoading = true;
                  });
                  if (isEditing) {
                    _bloc?.add(UpdateTopicEvent(topic: topic!));
                  } else {
                    _bloc?.add(AddTopicEvent(topic: topic!));
                  }
                  if (context.mounted) {
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(size.width, 50),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: isLoading
                    ? CupertinoActivityIndicator(
                        color: Theme.of(context).colorScheme.onPrimary,
                        radius: 14,
                      )
                    : const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool get isEditing => widget.topic != null;
}
