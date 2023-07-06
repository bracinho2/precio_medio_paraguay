import '../../../users/model/user_entity.dart';

import '../errors/user_error.dart';
import '../repository/auth_repository.dart';

abstract class UpdateUserUsecase {
  Future<bool> call({required UserEntity user});
}

class UpdateUser implements UpdateUserUsecase {
  final AuthRepository _repository;

  UpdateUser(this._repository);
  @override
  Future<bool> call({required UserEntity user}) async {
    if (!user.isValid()) {
      throw InvalidUser();
    }

    if (user.uid == null) {
      throw UserUidNotSet();
    }

    var oldUser = await _repository.getUserById(uid: user.uid!);

    if (oldUser == null) {
      throw NotFoundUser();
    }

    if (user == oldUser) {
      throw NothingChangedUser();
    }

    return _repository.updateUser(user: user);
  }
}
