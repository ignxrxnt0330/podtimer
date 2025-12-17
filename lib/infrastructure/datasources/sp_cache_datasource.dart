import 'package:podtimer/domain/datasources/cache_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpCacheDatasource implements CacheDataSource {
  late SharedPreferences prefs;
  @override
  Future<void> clearCache() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  Future<String?> getCachedData(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<void> setCachedData(String key, String data) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, data);
  }
}
