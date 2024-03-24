import 'package:equatable/equatable.dart';

class SearchEntities extends Equatable {
  final int movieId;
  final String title;
  final String image;

  const SearchEntities({
    required this.movieId,
    required this.title,
    required this.image,
  });

  @override
  List<Object> get props => [movieId, title,image];
}
