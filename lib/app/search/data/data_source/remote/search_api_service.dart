import 'package:dio/dio.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/enum/db_keys.dart';
import '../../../../../core/resources/http_response.dart';
import '../../models/search_model.dart';

class SearchApiService {
  final Dio _dio;
  const SearchApiService({required Dio dio}) : _dio = dio;

  Future<HttpResponse<List<SearchModel>>> searchMovies(String query) async {
    final queryParameters = {...AC.queryParameters};
    queryParameters['query'] = query;

    final Response result = await _dio.get(
      AC.search,
      queryParameters: queryParameters,
    );
    final List<SearchModel> searchList = result.data[DK.results.value]
        .map<SearchModel>(
            (dynamic i) => SearchModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return HttpResponse(data: searchList, response: result);
  }
}
