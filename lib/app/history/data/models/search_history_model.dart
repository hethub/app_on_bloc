import '../../../../core/enum/db_keys.dart';
import '../../domain/entities/search_history_entitiy.dart';

class SearchHistoryModel extends SearchHistoryEntitity {
  const SearchHistoryModel(
      {required int movieId,
      required String title,
      required int searchAt,
      required String url})
      : super(
          movieId: movieId,
          title: title,
          searchAt: searchAt,
          url: url,
        );
  factory SearchHistoryModel.formJson(Map<String, dynamic> map) {
    return SearchHistoryModel(
      movieId: map[DK.id.value],
      title: map[DK.originalTitle.value],
      searchAt: map[DK.searchAt.value],
      url: map[DK.posterPath.value],
    );
  }
  factory SearchHistoryModel.formEntity(SearchHistoryEntitity entity) {
    return SearchHistoryModel(
      movieId: entity.movieId,
      title: entity.title,
      searchAt: entity.searchAt,
      url: entity.url,
    );
  }
}
