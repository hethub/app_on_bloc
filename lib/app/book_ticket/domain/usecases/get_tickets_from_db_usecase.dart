import '../../../../core/usecase/usecase.dart';
import '../entities/ticket_detail_entity.dart';
import '../repository/book_ticket_repository.dart';

class GetTicketsFromDBUserCase
    implements UseCase<List<TicketDetailEntity>, String> {
  final BookTicketRepository _bookTicketRepository;
  GetTicketsFromDBUserCase(this._bookTicketRepository);

  @override
  Future<List<TicketDetailEntity>> call({String? params}) async {
    return _bookTicketRepository.getBookedTickets(params);
  }
}
