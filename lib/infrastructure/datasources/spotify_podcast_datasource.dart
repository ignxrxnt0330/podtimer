import 'package:podtimer/config/constants/environment.dart';
import 'package:podtimer/domain/datasources/podcasts_datasource.dart';
import 'package:podtimer/domain/entities/podcast.dart';
import 'package:podtimer/infrastructure/datasources/spotify_request_datasource.dart';

class SpotifyPodcastDatasource extends PodcastDatasource {
  final datasource = SpotifyRequestDatasource();

  @override
  Future<Podcast> getPodcast(String id) {
    return datasource.makeRequest(
      url: '${Environment.podcastUrl}/$id',
    ).then((data) => Podcast.fromJson(data));
  }

}
