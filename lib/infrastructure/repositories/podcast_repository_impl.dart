import 'package:podtimer/domain/datasources/podcasts_datasource.dart';
import 'package:podtimer/domain/entities/podcast.dart';
import 'package:podtimer/domain/repositories/podcast_repository.dart';

class PodcastRepositoryImpl implements PodcastRepository{
  final PodcastDatasource datasource;
  PodcastRepositoryImpl(this.datasource);

  @override
  Future<Podcast> getPodcast(String id) {
    return datasource.getPodcast(id);
  }
}
