part of 'following_bloc.dart';

class FollowingState extends Equatable {
  final List<Podcast> followedPodcasts;
  const FollowingState({this.followedPodcasts = const []});

  FollowingState copyWith({List<Podcast>? followedPodcasts}) {
    return FollowingState(
      followedPodcasts: followedPodcasts ?? this.followedPodcasts,
    );
  }

  @override
  List<Object> get props => [followedPodcasts];
}
