import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/usecase/get_movie_detail_usecase.dart';
import 'details_event.dart';
import 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, MovieDetailsState> {
  final GetMoviesDetailUserCase _getMoviesDetailUserCase;
  DetailsBloc(this._getMoviesDetailUserCase)
      : super(const MovieDetailsLoading()) {
    on<GetDetailsEvent>(onGetMovies);
  }
  void onGetMovies(
      GetDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final dataState = await _getMoviesDetailUserCase(params: event.id);

    if (dataState is DataSuccess) {
      emit(MovieDetailsDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(MovieDetailsError(dataState.error!));
    }
  }
}
