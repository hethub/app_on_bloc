import 'dart:io';
import 'package:dio/dio.dart';
import 'package:local_storage/core/resources/data_state.dart';
import '../../domain/repository/movies_repository.dart';
import '../data_source/remote/movie_api_service.dart';
import '../models/movies_model.dart';

class MovieRepositoryImp extends MoviesRepository {
  final MovieApiService _movieApiService;
  MovieRepositoryImp({required MovieApiService movieApiService})
      : _movieApiService = movieApiService;
  @override
  Future<DataState<List<MoviesModel>>> getMovies() async {
    try {
      final httpResponse = await _movieApiService.getMovies();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              type: DioExceptionType.badResponse,
              requestOptions: httpResponse.response.requestOptions),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
