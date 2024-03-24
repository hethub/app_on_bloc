import '../../../../core/usecase/usecase.dart';
import '../entities/ticket_detail_entity.dart';
import '../repository/book_ticket_repository.dart';

class InsertTicketINDBUserCase implements UseCase<bool, TicketDetailEntity> {
  final BookTicketRepository _bookTicketRepository;

  InsertTicketINDBUserCase(this._bookTicketRepository);

  @override
  Future<bool> call({TicketDetailEntity? params}) async {
    return _bookTicketRepository.insertTiketInDB(params!);
  }
}
