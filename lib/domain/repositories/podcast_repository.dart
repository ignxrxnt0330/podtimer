import 'package:podtimer/domain/entities/podcast.dart';

abstract class PodcastRepository {
  Future<Podcast> getPodcast(String id);
}
