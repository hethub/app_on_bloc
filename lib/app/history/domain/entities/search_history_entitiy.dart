import 'package:equatable/equatable.dart';

class SearchHistoryEntitity extends Equatable {
  final int movieId;
  final String title;
  final int searchAt;
  final String url;
  const SearchHistoryEntitity({
    required this.movieId,
    required this.title,
    required this.searchAt,
    required this.url,
  });

  @override
  List<Object?> get props => [movieId, title, searchAt, url];
}
