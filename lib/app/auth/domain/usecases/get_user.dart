import 'package:local_storage/app/auth/domain/entities/user_entity.dart';

import '../../../../core/usecase/usecase.dart';
import '../repository/user_repository.dart';

class GetUser implements UseCase<UserEntity?, void> {
  final UserReository _userReository;

  GetUser(this._userReository);

  @override
  Future<UserEntity?> call({void params}) async {
    return _userReository.getUser();
  }
}
