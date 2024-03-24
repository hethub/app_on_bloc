import 'package:local_storage/app/search/domain/entities/search_entities.dart';
import '../../../../core/enum/db_keys.dart';

class SearchModel extends SearchEntities {
  const SearchModel({
    required int movieId,
    required String title,
    required String image,
  }) : super(movieId: movieId, title: title, image: image);

  factory SearchModel.fromJson(Map<String, dynamic> map) {
    return SearchModel(
      movieId: map[DK.id.value],
      title: map[DK.originalTitle.value],
      image: map[DK.posterPath.value] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DK.id.value: movieId,
      DK.originalTitle.value: title,
      DK.posterPath.value: image,
    };
  }
}
