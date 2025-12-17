import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podtimer/domain/entities/podcast.dart';
import 'package:podtimer/presentation/blocs/following/following_bloc.dart';
import 'package:podtimer/presentation/widgets/shared/podcast/podcast_list_tile.dart';

class FollowingView extends StatefulWidget {
  const FollowingView({super.key});

  @override
  State<FollowingView> createState() => _FollowingViewState();
}

class _FollowingViewState extends State<FollowingView> {
  @override
  void initState() {
    super.initState();
    context.read<FollowingBloc>().add(const FetchFollowedPodcasts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowingBloc, FollowingState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.followedPodcasts.length,
          itemBuilder: (context, index) {
            //FIXME:
            if (state.followedPodcasts.isEmpty) {
              return const Center(
                child: Text("You are not following any podcasts."),
              );
            }

            return PodcastListTile(podcast: state.followedPodcasts[index]);
          },
        );
      },
    );
  }
}
