import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:podtimer/domain/entities/podcast.dart';

class PodcastListTile extends StatelessWidget {
  final Podcast podcast;
  const PodcastListTile({super.key, required this.podcast});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(podcast.images.first.url),
      ),
      title: Text(podcast.name),
      subtitle: Text(podcast.publisher),
      onTap: () {
        context.push('/podcast/${podcast.id}');
      },
    );
  }
}
