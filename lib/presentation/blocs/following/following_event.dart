part of 'following_bloc.dart';

abstract class FollowingEvent {
  const FollowingEvent();
}

class FetchFollowedPodcasts extends FollowingEvent {
  const FetchFollowedPodcasts();
}
