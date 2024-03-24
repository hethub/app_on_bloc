import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/usecase/get_movies_usecase.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUserCase _getMoviesUserCase;

  MoviesBloc(this._getMoviesUserCase) : super(const MoviesLoading()) {
    on<GetMovies>(onGetMovies);
  }

  void onGetMovies(GetMovies event, Emitter<MoviesState> emit) async {
    final dataState = await _getMoviesUserCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(MoviesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(MoviesError(dataState.error!));
    }
  }
}
