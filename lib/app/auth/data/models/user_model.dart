import 'package:local_storage/database/database.dart';

import '../../../../core/enum/db_keys.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {int? userId, String? email, String? password, bool? isSignIN})
      : super(
          userId: userId,
          email: email,
          password: password,
          isSignIN: isSignIN,
        );

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      userId: map[DK.userId],
      email: map[DK.email.value] ?? '',
      password: map[DK.password.value] ?? '',
      isSignIN: map[DK.isSignIN.value] ?? false,
    );
  }
  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      userId: userEntity.userId,
      email: userEntity.email,
      password: userEntity.password,
      isSignIN: userEntity.isSignIN,
    );
  }
  factory UserModel.fromUser(User user) {
    return UserModel(
      userId: user.id,
      email: user.email,
      password: user.password,
      isSignIN: user.isSignIN,
    );
  }
}
