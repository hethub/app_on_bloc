import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/enum/ticket_enum.dart';
import '../../domain/usecases/delete_movies_from_db_usercase.dart';
import '../../domain/usecases/get_tickets_from_db_usecase.dart';
import '../../domain/usecases/insert_ticket_in_db_usecase.dart';
import 'book_ticket_event.dart';
import 'book_ticket_state.dart';

class BookTicketBloc extends Bloc<BookTicketEvent, BookTicketState> {
  final InsertTicketINDBUserCase _insertTicketINDBUserCase;
  final GetTicketsFromDBUserCase _getTicketsFromDBUserCase;
  final DeleteMoviesFromDB _deleteMovieFromDBUserCase;

  BookTicketBloc(
      InsertTicketINDBUserCase insertTicketINDBUserCase,
      GetTicketsFromDBUserCase getTicketsFromDBUserCase,
      DeleteMoviesFromDB deleteMovieFromDBUserCase)
      : _getTicketsFromDBUserCase = getTicketsFromDBUserCase,
        _insertTicketINDBUserCase = insertTicketINDBUserCase,
        _deleteMovieFromDBUserCase = deleteMovieFromDBUserCase,
        super(const TicketsLoadingState()) {
    on<InsertTicketEvent>((event, emit) => insertTicketIntoDB(event, emit));
    on<GetTicketsDetailEvent>((event, emit) => getTicketFromDB(event, emit));
    on<SetDateTimeEvent>((event, emit) => setDateTime(event, emit));
    on<DeleteMovieEvent>((event, emit) => deleteMovie(event, emit));
  }

  void insertTicketIntoDB(
      InsertTicketEvent event, Emitter<BookTicketState> emit) async {
    emit(const TicketsLoadingState());
    final isInserted =
        await _insertTicketINDBUserCase.call(params: event.ticketDetailEntity);
    if (!isInserted) {
      emit(const BookTicketErrorState());
    } else {
      final result = await _getTicketsFromDBUserCase.call();
      emit(TicketDetailState(result));
    }
  }

  void getTicketFromDB(
      GetTicketsDetailEvent event, Emitter<BookTicketState> emit) async {
    final query = event.query;
    if (query == null) {
      emit(const TicketsLoadingState());
    }
    final result = await _getTicketsFromDBUserCase.call(params: query);
    emit(TicketDetailState(result));
  }

  TicketDateTime? selectedDateTime;
  final TextEditingController selectedDateController = TextEditingController(
      text: DateFormat('dd-MM-yyyy').format(DateTime.now()));

  void setDateTime(
      SetDateTimeEvent event, Emitter<BookTicketState> emit) async {
    emit(const TicketsLoadingState());
    selectedDateTime = event.dateTime;
    emit(const SetDateTimeState());
  }

  DateTimeRange? setDateTimeRange() {
    if (selectedDateTime != null) {
      return selectedDateTime!.bookingDateTime(selectedDateController.text);
    }
    return null;
  }

  void deleteMovie(
      DeleteMovieEvent event, Emitter<BookTicketState> emit) async {
    // emit(const TicketsLoadingState());
    final isDeleted =
        await _deleteMovieFromDBUserCase.call(params: event.movieId);
    if (!isDeleted) {
      emit(const BookTicketErrorState());
    } else {
      final result = await _getTicketsFromDBUserCase.call();
      emit(TicketDetailState(result));
    }
  }

  @override
  Future<void> close() {
    selectedDateController.dispose();
    return super.close();
  }
}
