import '../../../../core/enum/db_keys.dart';
import '../../domain/entities/ticket_detail_entity.dart';

class TicketDetailModel extends TicketDetailEntity {
  const TicketDetailModel({
    required int movieID,
    required String customerName,
    required String email,
    required int customerID,
    required int contactNumber,
    required String movieTitle,
    required String url,
    required int movieStartTime,
    required int movieEndTime,
  }) : super(
            movieID: movieID,
            contactNumber: contactNumber,
            email: email,
            customerID: customerID,
            movieTitle: movieTitle,
            customerName: customerName,
            movieStartTime: movieStartTime,
            movieEndTime: movieEndTime,
            url: url);

  factory TicketDetailModel.fromJson(Map<String, dynamic> map) {
    return TicketDetailModel(
        movieID: map[DK.movieID.value],
        contactNumber: map[DK.contactNumber.value],
        email: map[DK.email.value],
        customerID: map[DK.customerID.value],
        movieTitle: map[DK.movieTitle.value],
        customerName: map[DK.customerName.value],
        movieStartTime: map[DK.movieStartTime.value],
        movieEndTime: map[DK.movieEndTime.value],
        url: map[DK.url.value]);
  }
  factory TicketDetailModel.fromEntity(TicketDetailEntity entity) {
    return TicketDetailModel(
      movieID: entity.movieID,
      contactNumber: entity.contactNumber,
      email: entity.email,
      customerID: entity.customerID,
      movieTitle: entity.movieTitle,
      customerName: entity.customerName,
      movieStartTime: entity.movieStartTime,
      movieEndTime: entity.movieEndTime,
      url: entity.url,
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map[DK.movieID.value] = movieID;
    map[DK.contactNumber.value] = contactNumber;
    map[DK.email.value] = email;
    map[DK.customerID.value] = customerID;
    map[DK.movieTitle.value] = movieTitle;
    map[DK.customerName.value] = customerName;
    map[DK.movieStartTime.value] = movieStartTime;
    map[DK.movieEndTime.value] = movieEndTime;
    map[DK.url.value] = url;
    return map;
  }

  TicketDetailModel copyWith({
    int? movieID,
    String? customerName,
    String? email,
    int? customerID,
    int? contactNumber,
    String? movieTitle,
    String? url,
    int? movieStartTime,
    int? movieEndTime,
  }) {
    return TicketDetailModel(
      movieID: movieID ?? this.movieID,
      customerName: customerName ?? this.customerName,
      email: email ?? this.email,
      customerID: customerID ?? this.customerID,
      contactNumber: contactNumber ?? this.contactNumber,
      movieTitle: movieTitle ?? this.movieTitle,
      movieStartTime: movieStartTime ?? this.movieStartTime,
      movieEndTime: movieEndTime ?? this.movieEndTime,
      url: url ?? this.url,
    );
  }
}
