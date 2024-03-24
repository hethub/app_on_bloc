import 'package:dio/dio.dart';
import 'package:local_storage/core/constants/api_constants.dart';
import '../../../../../core/resources/http_response.dart';
import '../../models/movie_detail_model.dart';

class MovieDetailApiService {
  final Dio _dio;
  const MovieDetailApiService({required Dio dio}) : _dio = dio;

  Future<HttpResponse<MovieDetailModel>> getMovieDetail({required String id}) async {
    final Response result = await _dio.get(
      '${AC.details}/$id',
      queryParameters: AC.queryParameters,
    );
    final MovieDetailModel movieDetail =
        MovieDetailModel.fromJson(result.data as dynamic);
    return HttpResponse(data: movieDetail, response: result);
  }
}
