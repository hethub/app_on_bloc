import 'package:local_storage/app/book_ticket/domain/entities/ticket_detail_entity.dart';
import '../../domain/repository/book_ticket_repository.dart';
import '../data_source/local/book_ticket_service.dart';
import '../models/ticket_detail_model.dart';

class BookTicketRepositoryImp extends BookTicketRepository {
  final BookTicketService _bookTicketService;
  BookTicketRepositoryImp(BookTicketService bookTicketService)
      : _bookTicketService = bookTicketService;
  @override
  Future<List<TicketDetailModel>> getBookedTickets(String? query) async {
    final ticket = await _bookTicketService.getAllTickets(query);
    return ticket;
  }

  @override
  Future<bool> insertTiketInDB(TicketDetailEntity entity) async {
    final ticket = await _bookTicketService
        .bookTicket(TicketDetailModel.fromEntity(entity));
    return ticket;
  }

  @override
  Future<bool> deleteMovies(int id) async {
    return await _bookTicketService.deleteMovieById(id);
  }
}
