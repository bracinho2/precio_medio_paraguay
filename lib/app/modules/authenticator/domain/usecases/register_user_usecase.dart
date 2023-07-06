import '../../../users/model/user_entity.dart';
import '../errors/user_error.dart';
import '../repository/auth_repository.dart';

abstract class RegisterUserUsecase {
  Future<bool> call({required UserEntity user});
}

class RegisterUser implements RegisterUserUsecase {
  final AuthRepository _repository;

  RegisterUser(this._repository);
  @override
  Future<bool> call({required UserEntity user}) async {
    if (user.uid != null) {
      throw InvalidUser();
    }

    if (!user.isEmailValid()) {
      throw InvalidEmail();
    }

    if (!user.isValid()) {
      throw InvalidUser();
    }

    return await _repository.registerUser(user: user);
  }
}
