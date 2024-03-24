import 'package:local_storage/app/auth/domain/entities/user_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../repository/user_repository.dart';

class SignOutUser implements UseCase<bool, UserEntity> {
  final UserReository _userReository;

  SignOutUser(this._userReository);

  @override
  Future<bool> call({UserEntity? params}) async {
    return _userReository.signOutUser(params!);
  }
}
