typedef DK = DBkeys;

enum DBkeys {
  results(value: 'results'),
  userId(value: 'userId'),
  email(value: 'email'),
  password(value: 'password'),
  isSignIN(value: 'isSignIN'),
  adult(value: 'adult'),
  backdropPath(value: 'backdrop_path'),
  genreIds(value: 'genre_ids'),
  id(value: 'id'),
  originalLanguage(value: 'original_language'),
  originalTitle(value: 'original_title'),
  overview(value: 'overview'),
  popularity(value: 'popularity'),
  posterPath(value: 'poster_path'),
  releaseDate(value: 'release_date'),
  title(value: 'title'),
  video(value: 'video'),
  voteAverage(value: 'vote_average'),
  voteCount(value: 'vote_count'),
  budget(value: 'budget'),
  homepage(value: 'homepage'),
  imdbId(value: 'imdb_id'),
  revenue(value: 'revenue'),
  runtime(value: 'runtime'),
  status(value: 'status'),
  tagline(value: 'tagline'),
  movieID(value: 'movieID'),
  contactNumber(value: 'contactNumber'),
  customerID(value: 'customerID'),
  movieTitle(value: 'movieTitle'),
  customerName(value: 'customerName'),
  movieStartTime(value: 'movieStartTime'),
  movieEndTime(value: 'movieEndTime'),
  url(value: 'url'),
  searchAt(value: 'searchAt');

  final String value;
  const DBkeys({required this.value});
}
