/// API Constants
/// ===
typedef AC = ApiConstants;

abstract class ApiConstants {
  static const baseUrl = 'https://api.themoviedb.org';
  static const listing = '/3/movie/popular';
  static const details = '/3/movie'; // with id
  static const search = '/3/search/movie';

  static const kDefaultImage = 'https://image.tmdb.org/t/p/w500';
  static const ifImageNull = 'https://picsum.photos/200/300';

  static const queryParameters = {
    'api_key': '7d79a0348d08945377e89a95cd670c5a',
    'language': 'en-US',
    'Page': '1'
  };
}
