import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage/app/search/persentation/bloc/search_event.dart';
import 'package:local_storage/app/search/persentation/bloc/search_state.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/usecase/get_search_result_usecase.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchResultUsecase _getSearchResultUsecase;
  SearchBloc(GetSearchResultUsecase getSearchResultUsecase)
      : _getSearchResultUsecase = getSearchResultUsecase,
        super(const Empty()) {
    on<ONSearchEvent>(onSearch);
  }

  void onSearch(ONSearchEvent event, Emitter<SearchState> emit) async {
    final query = event.query;
    if (query.isEmpty) {
      emit(const Empty());
      return;
    }
    emit(const Loading());
    final dataState = await _getSearchResultUsecase(params: query);
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(Done(dataState.data!));
    }
    if (dataState is DataSuccess && dataState.data!.isEmpty) {
      emit(const NotFound());
    }
    if (dataState is DataFailed) {
      emit(Error(dataState.error!));
    }
  }
}
