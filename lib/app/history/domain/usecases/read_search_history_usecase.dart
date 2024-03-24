import '../../../../core/usecase/usecase.dart';
import '../entities/search_history_entitiy.dart';
import '../repository/search_history_repository.dart';

class ReadSearchHistoryUsecase
    implements UseCase<List<SearchHistoryEntitity>, String> {
  final SearchHistoryRepository _searchHistoryRepository;
  ReadSearchHistoryUsecase(SearchHistoryRepository searchHistoryRepository)
      : _searchHistoryRepository = searchHistoryRepository;

  @override
  Future<List<SearchHistoryEntitity>> call({String? params}) async {
    return _searchHistoryRepository.read(params);
  }
}
