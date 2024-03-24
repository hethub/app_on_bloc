import 'package:local_storage/database/database.dart';

import '../../models/search_history_model.dart';

abstract class SearchHistoryDatabase {
  Future<bool> saveInDB(SearchHistoryModel searchHistoryModel);
  Future<List<SearchHistoryModel>> readFromDB(String? query);
  Future<bool> delete(int id);
}

class SearchHistoryLocalService implements SearchHistoryDatabase {
  @override
  Future<bool> saveInDB(SearchHistoryModel searchHistoryMode) async {
    final history = History();
    history.movieID = searchHistoryMode.movieId;
    history.title = searchHistoryMode.title;
    history.url = searchHistoryMode.url;
    history.searchAt = searchHistoryMode.searchAt;
    final result = await history.save();
    if (result == null) return false;
    return true;
  }

  @override
  Future<List<SearchHistoryModel>> readFromDB(String? query) async {
    final history = History();
    if (query != null && query.isNotEmpty) {
      final data = await history
          .select()
          .where("title LIKE '%$query%'")
          .orderByDesc('searchAt')
          .toList();
      return data
          .map((e) => SearchHistoryModel(
                movieId: e.movieID!,
                title: e.title!,
                searchAt: e.searchAt!,
                url: e.url!,
              ))
          .toList();
    } else {
      final data = await history.select().orderByDesc('searchAt').toList();
      return data
          .map((e) => SearchHistoryModel(
                movieId: e.movieID!,
                title: e.title!,
                searchAt: e.searchAt!,
                url: e.url!,
              ))
          .toList();
    }
  }

  @override
  Future<bool> delete(int id) async {
    final del = await History().select().movieID.equals(id).delete();
    return del.success;
  }
}
