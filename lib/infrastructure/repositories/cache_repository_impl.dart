import 'package:podtimer/domain/repositories/cache_repository.dart';
import 'package:podtimer/infrastructure/datasources/sp_cache_datasource.dart';

class CacheRepositoryImpl extends CacheRepository {
  final SpCacheDatasource datasource;

  CacheRepositoryImpl(this.datasource);

  @override
  Future<void> clearCache() {
    return datasource.clearCache();
  }

  @override
  Future<String?> getCachedData(String key) {
    return datasource.getCachedData(key);
  }

  @override
  Future<void> setCachedData(String key, String data) {
    return datasource.setCachedData(key, data);
  }
}
