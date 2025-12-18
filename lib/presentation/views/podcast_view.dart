import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podtimer/domain/entities/podcast.dart';
import 'package:podtimer/presentation/blocs/podcast/podcast_bloc.dart';
import 'package:podtimer/presentation/widgets/shared/full_screen_loader.dart';

class PodcastView extends StatelessWidget {
  final Podcast? podcast;
  const PodcastView({super.key, this.podcast});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PodcastBloc, PodcastState>(
      builder: (context, state) {
      print('Building PodcastView with podcast: ${state.podcast}');
    if (state.podcast == null) {
      return const Material(
        child: Center(
          child: FullScreenLoader(),
        ),
      );
    }

    return Material(
      child: Center(
        child: Text('Podcast: ${state.podcast!.name}'),
      ),
    );
      },
    );
  }
}
