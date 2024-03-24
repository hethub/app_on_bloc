import 'package:local_storage/app/history/domain/entities/search_history_entitiy.dart';
import '../../domain/repository/search_history_repository.dart';
import '../data_source/local/search_history_local_service.dart';
import '../models/search_history_model.dart';

class SearchHistoryRepositoryImpl implements SearchHistoryRepository {
  final SearchHistoryDatabase _searchHistoryDatabase;
  SearchHistoryRepositoryImpl(SearchHistoryDatabase searchHistoryDatabase)
      : _searchHistoryDatabase = searchHistoryDatabase;

  @override
  Future<List<SearchHistoryModel>> read(String? query) async {
    return _searchHistoryDatabase.readFromDB(query);
  }

  @override
  Future<bool> save(SearchHistoryEntitity data) async {
    return _searchHistoryDatabase.saveInDB(SearchHistoryModel.formEntity(data));
  }

  @override
  Future<bool> delete(int id) {
    return _searchHistoryDatabase.delete(id);
  }
}
