part of 'podcast_bloc.dart';

class PodcastState extends Equatable {
  final Podcast? podcast;
  const PodcastState({
    this.podcast
  });

  PodcastState copyWith({
    Podcast? podcast,
  }) {
    return PodcastState(
      podcast: podcast ?? this.podcast,
    );
  }

  @override
  List<Object> get props => [podcast ?? ''];
}
