part of 'podcast_bloc.dart';

abstract class PodcastEvent {
  const PodcastEvent();
}

class FetchPodcast extends PodcastEvent {
  final String id;
  const FetchPodcast(this.id);
}

class FetchedPodcast extends PodcastEvent {
  const FetchedPodcast();
}
