import 'package:local_storage/app/search/domain/entities/search_entities.dart';

import '../../../../core/resources/data_state.dart';

abstract class SearchRepository {
  Future<DataState<List<SearchEntities>>> searchMovies(String query);
}
