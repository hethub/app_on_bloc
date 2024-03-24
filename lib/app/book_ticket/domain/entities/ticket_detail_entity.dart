import 'package:equatable/equatable.dart';

class TicketDetailEntity extends Equatable {
  final int movieID;
  final String customerName;
  final String email;
  final int customerID;
  final int contactNumber;
  final String movieTitle;
  final String url;
  final int movieStartTime;
  final int movieEndTime;

  const TicketDetailEntity({
    required this.movieID,
    required this.contactNumber,
    required this.email,
    required this.customerID,
    required this.movieTitle,
    required this.url,
    required this.customerName,
    required this.movieStartTime,
    required this.movieEndTime,
  });

  @override
  List<Object?> get props => [
        movieID,
        contactNumber,
        email,
        customerID,
        movieTitle,
        customerName,
        movieStartTime,
        movieEndTime,
      ];
}
