import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podtimer/domain/entities/podcast.dart';
import 'package:podtimer/infrastructure/datasources/spotify_home_datasource.dart';
import 'package:podtimer/infrastructure/repositories/home_repository_impl.dart';
part 'following_event.dart';
part 'following_state.dart';

class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  final auth = HomeRepositoryImpl(SpotifyHomeDatasource());

  FollowingBloc() : super(const FollowingState()) {
    on<FetchFollowedPodcasts>((event, emit) async {
      List<Podcast> podcasts = await auth.followedPodcasts();
      emit(state.copyWith(followedPodcasts: podcasts));
    });
  }
}
