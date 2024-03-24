import '../../../../core/resources/data_state.dart';
import '../entities/movie_detail_entity.dart';

abstract class MovieDetailRepository {
  Future<DataState<MovieDetailEntity>> getMovieDetail({required String id});
}
