import 'package:local_storage/app/auth/data/models/user_model.dart';
import 'package:local_storage/app/auth/domain/entities/user_entity.dart';

import '../../domain/repository/user_repository.dart';
import '../data_source/local/SQF/auth_sqf.dart';
// import '../data_source/local/user_database.dart';

class UserRepositoryImp implements UserReository {
  // final UserDatabase _userDatabase;
  final AuthSqf _userDatabase;
  const UserRepositoryImp(this._userDatabase);

  @override
  Future<bool> saveUser(UserEntity createUser) async {
    // _userDatabase.authSqf.createUser(UserModel.fromEntity(createUser));
    _userDatabase.createUser(UserModel.fromEntity(createUser));
    return true;
  }

  @override
  Future<bool> signInUser(UserEntity userEntity) async {
    final status =
        // await _userDatabase.authSqf.signIn(UserModel.fromEntity(userEntity));
        await _userDatabase.signIn(UserModel.fromEntity(userEntity));
    return status;
  }

  @override
  Future<bool> signOutUser(UserEntity userEntity) async {
    final status =
        // await _userDatabase.authSqf.signIn(UserModel.fromEntity(userEntity));
        await _userDatabase.signOut(UserModel.fromEntity(userEntity));
    return status;
  }

  @override
  Future<UserEntity?> getUser() async {
    // final profile = await _userDatabase.authSqf.getUserProfile(id);
    final profile = await _userDatabase.getUserProfile();
    return profile;
  }
}
