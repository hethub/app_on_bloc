import '../../../../core/resources/data_state.dart';
import '../entities/movies_entities.dart';

abstract class MoviesRepository {
  Future<DataState<List<MoviesEntities>>> getMovies();
}
