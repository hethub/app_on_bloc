import 'package:local_storage/app/auth/domain/entities/user_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../repository/user_repository.dart';

class RegisterUser implements UseCase<bool, UserEntity> {
  final UserReository _userReository;

  RegisterUser(this._userReository);

  @override
  Future<bool> call({UserEntity? params}) async {
    return _userReository.saveUser(params!);
  }
}
