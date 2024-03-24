import '../entities/search_history_entitiy.dart';

/// IT Handle Both [API], [Local]
///===
abstract class SearchHistoryRepository {
  Future<bool> save(SearchHistoryEntitity data);
  Future<List<SearchHistoryEntitity>> read(String? query);
  Future<bool> delete(int id);
}
