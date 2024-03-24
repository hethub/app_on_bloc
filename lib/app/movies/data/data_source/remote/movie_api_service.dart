import 'package:dio/dio.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/enum/db_keys.dart';
import '../../../../../core/resources/http_response.dart';
import '../../models/movies_model.dart';

class MovieApiService {
  final Dio _dio;
  const MovieApiService({required Dio dio}) : _dio = dio;

  Future<HttpResponse<List<MoviesModel>>> getMovies() async {
    final Response result = await _dio.get(
      AC.listing,
      queryParameters: AC.queryParameters,
    );
    final List<MoviesModel> moviesList = result.data[DK.results.value]
        .map<MoviesModel>(
            (dynamic i) => MoviesModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return HttpResponse(data: moviesList, response: result);
  }
}
