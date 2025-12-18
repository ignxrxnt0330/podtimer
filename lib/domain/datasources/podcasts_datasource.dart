import 'package:podtimer/domain/entities/podcast.dart';

abstract class PodcastDatasource {
  Future<Podcast> getPodcast(String id);
}
