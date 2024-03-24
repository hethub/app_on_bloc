import '../entities/ticket_detail_entity.dart';

abstract class BookTicketRepository {
  Future<bool> insertTiketInDB(TicketDetailEntity entity);
  Future<List<TicketDetailEntity>> getBookedTickets(String? query);
  Future<bool> deleteMovies(int id);
}
