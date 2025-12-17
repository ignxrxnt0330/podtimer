part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int index;
  final Podcast? recentlyPlayed;
  final List<Podcast> followedPodcasts;
  final TimePeriodStats? todayStats;
  const HomeState({
    this.index = 0,
    this.recentlyPlayed,
    this.followedPodcasts = const <Podcast>[],
    this.todayStats,
  });

  HomeState copyWith({
    int? index,
    Podcast? recentlyPlayed,
    List<Podcast>? followedPodcasts,
    TimePeriodStats? todayStats,
  }) {
    return HomeState(index: index ?? this.index);
  }

  @override
  List<Object> get props => [index, followedPodcasts];
}
