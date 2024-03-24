import 'package:local_storage/app/movies/domain/entities/movies_entities.dart';
import '../../../../core/enum/db_keys.dart';

class MoviesModel extends MoviesEntities {
  const MoviesModel({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    String? overvieworiginalLanguage,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          genreIds: genreIds,
          id: id,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );
  factory MoviesModel.fromJson(Map<String, dynamic> map) {
    return MoviesModel(
      adult: map[DK.adult.value],
      backdropPath: map[DK.backdropPath.value],
      genreIds: map[DK.genreIds.value].cast<int>(),
      id: map[DK.id.value],
      originalLanguage: map[DK.originalLanguage.value],
      originalTitle: map[DK.originalTitle.value],
      overview: map[DK.overview.value],
      popularity: map[DK.popularity.value],
      posterPath: map[DK.posterPath.value],
      releaseDate: map[DK.releaseDate.value],
      title: map[DK.title.value],
      video: map[DK.video.value],
      voteAverage: map[DK.voteAverage.value].toDouble(),
      voteCount: map[DK.voteCount.value],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map[DK.adult.value] = adult;
    map[DK.backdropPath.value] = backdropPath;
    map[DK.genreIds.value] = genreIds;
    map[DK.id.value] = id;
    map[DK.originalLanguage.value] = originalLanguage;
    map[DK.originalTitle.value] = originalTitle;
    map[DK.overview.value] = overview;
    map[DK.popularity.value] = popularity;
    map[DK.posterPath.value] = posterPath;
    map[DK.releaseDate.value] = releaseDate;
    map[DK.title.value] = title;
    map[DK.video.value] = video;
    map[DK.voteAverage.value] = voteAverage;
    map[DK.voteCount.value] = voteCount;

    return map;
  }
}
