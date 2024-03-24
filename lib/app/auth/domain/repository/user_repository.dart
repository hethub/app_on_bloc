import 'package:local_storage/app/auth/domain/entities/user_entity.dart';

abstract class UserReository {
  Future<UserEntity?> getUser();
  Future<bool> saveUser(UserEntity userEntity);
  Future<bool> signInUser(UserEntity userEntity);
  Future<bool> signOutUser(UserEntity userEntity);
}
