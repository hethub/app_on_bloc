import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../domain/entities/movie_detail_entity.dart';

abstract class MovieDetailsState extends Equatable {
  final MovieDetailEntity? detail;
  final DioException? error;

  const MovieDetailsState({this.detail, this.error});

  @override
  List<Object> get props => [detail!, error!];
}

class MovieDetailsLoading extends MovieDetailsState {
  const MovieDetailsLoading();
}

class MovieDetailsDone extends MovieDetailsState {
  const MovieDetailsDone(MovieDetailEntity detail) : super(detail: detail);
}

class MovieDetailsError extends MovieDetailsState {
  const MovieDetailsError(DioException error) : super(error: error);
}
