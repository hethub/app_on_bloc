import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/delete_search_history_usecase.dart';
import '../../../domain/usecases/read_search_history_usecase.dart';
import '../../../domain/usecases/save_search_history_usecase.dart';
import 'local_history_event.dart';
import 'local_history_sate.dart';

class LocalHistoryBloc extends Bloc<LocalHistoryEvent, LocalHistoryState> {
  final ReadSearchHistoryUsecase _readSearchHistoryUsecase;
  final SaveSearchHistoryUsecase _saveSearchHistoryUsecase;
  final DeleteSearchHistoryUsecase _deleteSearchHistoryUsecase;
  LocalHistoryBloc(
      ReadSearchHistoryUsecase readSearchHistoryUsecase,
      SaveSearchHistoryUsecase saveSearchHistoryUsecase,
      DeleteSearchHistoryUsecase deleteSearchHistoryUsecase)
      : _readSearchHistoryUsecase = readSearchHistoryUsecase,
        _saveSearchHistoryUsecase = saveSearchHistoryUsecase,
        _deleteSearchHistoryUsecase = deleteSearchHistoryUsecase,
        super(const LocalHistoryLoading()) {
    on<SaveLocalHistoryEvent>((event, emit) => onSave(event, emit));
    on<GetLocalHistoryEvent>((event, emit) => onRead(event, emit));
    on<DeleteLocalHistoryEvent>((event, emit) => onDelete(event, emit));
  }

  void onSave(
      SaveLocalHistoryEvent event, Emitter<LocalHistoryState> emit) async {
    await _saveSearchHistoryUsecase.call(params: event.searchHistoryEntitity);
    final data = await _readSearchHistoryUsecase.call();
    emit(LocalHistoryDone(data));
  }

  void onRead(
      GetLocalHistoryEvent event, Emitter<LocalHistoryState> emit) async {
    final data = await _readSearchHistoryUsecase.call(params: event.query);
    if ((event.query?.isNotEmpty == true) && data.isEmpty) {
      emit(const LocalHistoryNotFound());
    } else if (data.isEmpty) {
      emit(const LocalHistoryEmpty());
    } else {
      emit(LocalHistoryDone(data));
    }
  }

  void onDelete(
      DeleteLocalHistoryEvent event, Emitter<LocalHistoryState> emit) async {
    await _deleteSearchHistoryUsecase.call(params: event.id);
    final data = await _readSearchHistoryUsecase.call(params: event.query);
    emit(LocalHistoryDone(data));
  }
}
