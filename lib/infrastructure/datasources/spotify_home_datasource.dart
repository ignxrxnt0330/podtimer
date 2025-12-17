import 'package:podtimer/config/constants/environment.dart';
import 'package:podtimer/domain/datasources/home_datasource.dart';
import 'package:podtimer/domain/entities/podcast.dart';
import 'package:podtimer/domain/entities/time_period_stats.dart';
import 'package:podtimer/infrastructure/datasources/spotify_request_datasource.dart';

class SpotifyHomeDatasource extends HomeDatasource {
  final datasource = SpotifyRequestDatasource();

  @override
  Future<Podcast> recentlyPlayed() async {
    final podcast = Podcast();
    return podcast;
  }

  @override
  Future<List<Podcast>> followedPodcasts() async {
    final podcasts = <Podcast>[];
    final response = await datasource.makeRequest(
      url: Environment.userShowsUrl,
    );
    response['items'].forEach((item) {
      final podcast = Podcast.fromJson(item['show']);
      podcasts.add(podcast);
    });

    return podcasts;
  }

  // stats
  @override
  Future<TimePeriodStats> todayStats() async {
    final stats = TimePeriodStats();
    return stats;
  }

  @override
  Future<TimePeriodStats> weeklyStats() async {
    final stats = TimePeriodStats();
    return stats;
  }

  @override
  Future<TimePeriodStats> monthlyStats() async {
    final stats = TimePeriodStats();
    return stats;
  }

  @override
  Future<TimePeriodStats> yearlyStats() async {
    final stats = TimePeriodStats();
    return stats;
  }
}
