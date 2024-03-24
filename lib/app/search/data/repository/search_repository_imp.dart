import 'dart:io';
import 'package:dio/dio.dart';
import 'package:local_storage/core/resources/data_state.dart';
import '../../domain/repository/search_repository.dart';
import '../data_source/remote/search_api_service.dart';
import '../models/search_model.dart';

class SearchRepositoryImp extends SearchRepository {
  final SearchApiService _searchApiService;
  SearchRepositoryImp({required SearchApiService searchApiService})
      : _searchApiService = searchApiService;

  @override
  Future<DataState<List<SearchModel>>> searchMovies(String query) async {
    try {
      final httpResponse = await _searchApiService.searchMovies(query);
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
