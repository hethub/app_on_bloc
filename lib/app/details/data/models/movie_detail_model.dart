import '../../../../core/enum/db_keys.dart';
import '../../domain/entities/movie_detail_entity.dart';

class MovieDetailModel extends MovieDetailEntity {
  const MovieDetailModel({
    bool? adult,
    String? backdropPath,
    int? budget,
    String? homepage,
    int? id,
    String? imdbId,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    int? revenue,
    int? runtime,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          budget: budget,
          homepage: homepage,
          id: id,
          imdbId: imdbId,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          revenue: revenue,
          runtime: runtime,
          status: status,
          tagline: tagline,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      adult: json[DK.adult.value],
      backdropPath: json[DK.backdropPath.value],
      budget: json[DK.budget.value],
      homepage: json[DK.homepage.value],
      id: json[DK.id.value],
      imdbId: json[DK.imdbId.value],
      originalLanguage: json[DK.originalLanguage.value],
      originalTitle: json[DK.originalTitle.value],
      overview: json[DK.overview.value],
      popularity: json[DK.popularity.value],
      posterPath: json[DK.posterPath.value],
      releaseDate: json[DK.releaseDate.value],
      revenue: json[DK.revenue.value],
      runtime: json[DK.runtime.value],
      status: json[DK.status.value],
      tagline: json[DK.tagline.value],
      title: json[DK.title.value],
      video: json[DK.video.value],
      voteAverage: json[DK.voteAverage.value],
      voteCount: json[DK.voteCount.value],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['budget'] = budget;
    map['homepage'] = homepage;
    map[DK.id.value] = id;
    map['imdb_id'] = imdbId;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
}
