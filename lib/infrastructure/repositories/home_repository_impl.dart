import 'package:podtimer/domain/entities/podcast.dart';
import 'package:podtimer/domain/entities/time_period_stats.dart';
import 'package:podtimer/domain/repositories/home_repository.dart';
import 'package:podtimer/infrastructure/datasources/spotify_home_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final SpotifyHomeDatasource datasource;
  HomeRepositoryImpl(this.datasource);

  @override
  Future<List<Podcast>> followedPodcasts() {
    return datasource.followedPodcasts();
  }

  @override
  Future<TimePeriodStats> monthlyStats() {
    return datasource.monthlyStats();
  }

  @override
  Future<Podcast> recentlyPlayed() {
    return datasource.recentlyPlayed();
  }

  @override
  Future<TimePeriodStats> todayStats() {
    return datasource.todayStats();
  }

  @override
  Future<TimePeriodStats> weeklyStats() {
    return datasource.weeklyStats();
  }

  @override
  Future<TimePeriodStats> yearlyStats() {
    return datasource.yearlyStats();
  }
}
