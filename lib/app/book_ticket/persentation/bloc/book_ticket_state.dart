import '../../domain/entities/ticket_detail_entity.dart';

abstract class BookTicketState {
  const BookTicketState();
}

class TicketsLoadingState extends BookTicketState {
  const TicketsLoadingState();
}

class TicketDetailState extends BookTicketState {
  final List<TicketDetailEntity> tickets;
  const TicketDetailState(this.tickets);
}

class BookTicketErrorState extends BookTicketState {
  const BookTicketErrorState();
}

class SetDateTimeState extends BookTicketState {
  const SetDateTimeState();
}
