abstract class CacheRepository {
  Future<void> clearCache();
  Future<String?> getCachedData(String key);
  Future<void> setCachedData(String key, String data);
}
