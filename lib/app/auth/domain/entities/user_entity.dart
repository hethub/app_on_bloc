import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? userId;
  final String? email;
  final String? password;
  final bool? isSignIN;
  const UserEntity({this.userId, this.email, this.password, this.isSignIN});
  @override
  List<Object?> get props => [userId, email, password, isSignIN];
}
