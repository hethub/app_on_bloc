import '../../../../core/usecase/usecase.dart';
import '../repository/search_history_repository.dart';

class DeleteSearchHistoryUsecase implements UseCase<bool, int> {
  final SearchHistoryRepository _searchHistoryRepository;

  DeleteSearchHistoryUsecase(SearchHistoryRepository searchHistoryRepository)
      : _searchHistoryRepository = searchHistoryRepository;

  @override
  Future<bool> call({int? params}) async {
    return _searchHistoryRepository.delete(params!);
  }
}
