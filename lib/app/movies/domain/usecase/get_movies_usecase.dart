import 'package:local_storage/app/movies/domain/entities/movies_entities.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/movies_repository.dart';

class GetMoviesUserCase
    implements UseCase<DataState<List<MoviesEntities>>, void> {
  final MoviesRepository _moviesRepository;
  GetMoviesUserCase(this._moviesRepository);

  @override
  Future<DataState<List<MoviesEntities>>> call({void params}) {
    return _moviesRepository.getMovies();
  }
}
