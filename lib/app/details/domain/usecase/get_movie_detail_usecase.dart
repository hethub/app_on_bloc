import 'package:local_storage/core/resources/data_state.dart';

import '../../../../core/usecase/usecase.dart';
import '../entities/movie_detail_entity.dart';
import '../repository/movies_detail_repository.dart';

class GetMoviesDetailUserCase
    implements UseCase<DataState<MovieDetailEntity>, String> {
  final MovieDetailRepository _movieDetailRepository;
  GetMoviesDetailUserCase(
      {required MovieDetailRepository movieDetailRepository})
      : _movieDetailRepository = movieDetailRepository;

  @override
  Future<DataState<MovieDetailEntity>> call({String? params}) {
    return _movieDetailRepository.getMovieDetail(id: params!);
  }
}
