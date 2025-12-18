import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podtimer/domain/entities/podcast.dart';
import 'package:podtimer/infrastructure/datasources/spotify_podcast_datasource.dart';
import 'package:podtimer/infrastructure/repositories/podcast_repository_impl.dart';
part 'podcast_event.dart';
part 'podcast_state.dart';

class PodcastBloc extends Bloc<PodcastEvent, PodcastState> {
  final repository = PodcastRepositoryImpl(SpotifyPodcastDatasource());
  PodcastBloc() : super(const PodcastState()) {
    on<FetchPodcast>((event, emit) async {
      emit(state.copyWith());
      final Podcast podcast = await repository.getPodcast(event.id);
      emit(state.copyWith(podcast: podcast));
      add(const FetchedPodcast());
    });

    on<FetchedPodcast>((event, emit) async {
      emit(state.copyWith(podcast: state.podcast));
    });
  }
}
