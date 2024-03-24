import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/search_entities.dart';
import '../repository/search_repository.dart';

class GetSearchResultUsecase
    implements UseCase<DataState<List<SearchEntities>>, String> {
  final SearchRepository _searchRepository;
  GetSearchResultUsecase(this._searchRepository);

  @override
  Future<DataState<List<SearchEntities>>> call({String? params}) {
    return _searchRepository.searchMovies(params!);
  }
}
