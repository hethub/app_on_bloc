import 'dart:io';
import 'package:dio/dio.dart';
import 'package:local_storage/core/resources/data_state.dart';
import '../../domain/repository/movies_detail_repository.dart';
import '../data_source/remote/movie_detail_api_service.dart';
import '../models/movie_detail_model.dart';

class MovieDetailRepositoryImp extends MovieDetailRepository {
  final MovieDetailApiService _movieDetailApiService;
  MovieDetailRepositoryImp(
      {required MovieDetailApiService movieDetailApiService})
      : _movieDetailApiService = movieDetailApiService;

  @override
  Future<DataState<MovieDetailModel>> getMovieDetail(
      {required String id}) async {
    try {
      final httpResponse = await _movieDetailApiService.getMovieDetail(id: id);

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
