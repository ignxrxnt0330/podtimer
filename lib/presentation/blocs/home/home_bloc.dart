import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podtimer/domain/entities/podcast.dart';
import 'package:podtimer/domain/entities/time_period_stats.dart';
import 'package:podtimer/infrastructure/datasources/spotify_home_datasource.dart';
import 'package:podtimer/infrastructure/repositories/home_repository_impl.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final repository = HomeRepositoryImpl(SpotifyHomeDatasource());
  HomeBloc() : super(const HomeState()) {
    on<IndexChanged>((event, emit) async {
      emit(state.copyWith(index: event.index));
    });
    on<FetchData>((event, emit) async {
      List<Podcast> podcasts = await repository.followedPodcasts();
      Podcast recentlyPlayed = await repository.recentlyPlayed();
      TimePeriodStats todayStats = await repository.todayStats();

      emit(
        state.copyWith(
          followedPodcasts: podcasts,
          recentlyPlayed: recentlyPlayed,
          todayStats: todayStats,
        ),
      );
    });
  }
}
