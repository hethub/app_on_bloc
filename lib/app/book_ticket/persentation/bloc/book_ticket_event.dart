import '../../../../core/enum/ticket_enum.dart';
import '../../domain/entities/ticket_detail_entity.dart';

abstract class BookTicketEvent {
  const BookTicketEvent();
}

class InsertTicketEvent extends BookTicketEvent {
  final TicketDetailEntity ticketDetailEntity;
  const InsertTicketEvent({required this.ticketDetailEntity});
}

class DeleteMovieEvent extends BookTicketEvent {
  final int movieId;
  const DeleteMovieEvent({required this.movieId});
}

class GetTicketsDetailEvent extends BookTicketEvent {
  final String? query;
  const GetTicketsDetailEvent({this.query});
}

class SetDateTimeEvent extends BookTicketEvent {
  final TicketDateTime? dateTime;
  const SetDateTimeEvent(this.dateTime);
}
