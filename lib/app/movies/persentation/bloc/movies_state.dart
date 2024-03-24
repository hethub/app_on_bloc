import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:local_storage/app/movies/domain/entities/movies_entities.dart';

abstract class MoviesState extends Equatable {
  final List<MoviesEntities>? movies;
  final DioException? error;

  const MoviesState({this.movies, this.error});

  @override
  List<Object> get props => [movies!, error!];
}

class MoviesLoading extends MoviesState {
  const MoviesLoading();
}

class MoviesDone extends MoviesState {
  const MoviesDone(List<MoviesEntities> movies) : super(movies: movies);
}

class MoviesError extends MoviesState {
  const MoviesError(DioException error) : super(error: error);
}
