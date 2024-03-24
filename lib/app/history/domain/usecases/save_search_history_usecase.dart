import 'package:local_storage/app/history/domain/entities/search_history_entitiy.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/search_history_repository.dart';

class SaveSearchHistoryUsecase implements UseCase<bool, SearchHistoryEntitity> {
  final SearchHistoryRepository _searchHistoryRepository;

  SaveSearchHistoryUsecase(SearchHistoryRepository searchHistoryRepository)
      : _searchHistoryRepository = searchHistoryRepository;

  @override
  Future<bool> call({SearchHistoryEntitity? params}) async {
    return _searchHistoryRepository.save(params!);
  }
}
