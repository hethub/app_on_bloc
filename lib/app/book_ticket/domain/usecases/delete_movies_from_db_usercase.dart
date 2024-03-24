import '../../../../core/usecase/usecase.dart';
import '../repository/book_ticket_repository.dart';

class DeleteMoviesFromDB implements UseCase<bool, int> {
  final BookTicketRepository _bookTicketRepository;
  DeleteMoviesFromDB(this._bookTicketRepository);

  @override
  Future<bool> call({int? params}) async {
    return _bookTicketRepository.deleteMovies(params!);
  }
}
