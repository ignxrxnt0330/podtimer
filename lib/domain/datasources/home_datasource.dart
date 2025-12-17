import 'package:podtimer/domain/entities/podcast.dart';
import 'package:podtimer/domain/entities/time_period_stats.dart';

abstract class HomeDatasource {
  Future<Podcast> recentlyPlayed();
  Future<List<Podcast>> followedPodcasts();

  // stats
  Future<TimePeriodStats> todayStats();
  Future<TimePeriodStats> weeklyStats();
  Future<TimePeriodStats> monthlyStats();
  Future<TimePeriodStats> yearlyStats();
}
