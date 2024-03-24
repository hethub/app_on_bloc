import '../../../../../database/database.dart';
import '../../models/ticket_detail_model.dart';

class BookTicketService {
  Future<bool> bookTicket(TicketDetailModel data) async {
    final ticket = Ticket();
    ticket.ticketID = DateTime.now().millisecondsSinceEpoch;
    ticket.movieID = data.movieID;
    ticket.customerName = data.customerName;
    ticket.email = data.email;
    ticket.customerID = data.customerID;
    ticket.contactNumber = data.contactNumber;
    ticket.movieTitle = data.movieTitle;
    ticket.movieStartTime = data.movieStartTime;
    ticket.movieEndTime = data.movieEndTime;
    ticket.url = data.url;
    final result = await ticket.save();
    if (result == null) {
      return false;
    }

    return true;
  }

  Future<List<TicketDetailModel>> getAllTickets(String? query) async {
    final ticket = Ticket();

    if (query != null && query.isNotEmpty) {
      final t = await ticket
          .select()
          .where("movieTitle LIKE '%$query%'")
          .orderByDesc('ticketID')
          .toList();
      return t
          .map(
            (e) => TicketDetailModel(
              movieID: e.movieID!,
              customerName: e.customerName!,
              email: e.email!,
              customerID: e.customerID!,
              contactNumber: e.contactNumber!,
              movieTitle: e.movieTitle!,
              movieStartTime: e.movieStartTime!,
              movieEndTime: e.movieEndTime!,
              url: e.url!,
            ),
          )
          .toList();
    } else {
      final t = await ticket.select().orderByDesc('ticketID').toList();
      return t
          .map(
            (e) => TicketDetailModel(
              movieID: e.movieID!,
              customerName: e.customerName!,
              email: e.email!,
              customerID: e.customerID!,
              contactNumber: e.contactNumber!,
              movieTitle: e.movieTitle!,
              movieStartTime: e.movieStartTime!,
              movieEndTime: e.movieEndTime!,
              url: e.url!,
            ),
          )
          .toList();
    }
  }

  Future<bool> deleteMovieById(int id) async {
    final ticket = Ticket();
    final result = await ticket.select().movieID.equals(id).delete();
    return result.success;
  }
}
