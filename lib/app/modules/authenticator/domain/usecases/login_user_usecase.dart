import 'package:precio_medio_paraguay/app/modules/authenticator/core/typedef/typedef.dart';

import '../entities/user_login_params.dart';
import '../errors/user_error.dart';
import '../repository/auth_repository.dart';

abstract class LoginUserUsecase {
  Future<LoginResult?> call({required UserLoginParams params});
}

class LoginUser implements LoginUserUsecase {
  final AuthRepository _repository;

  LoginUser(this._repository);
  @override
  Future<LoginResult?> call({required UserLoginParams params}) async {
    if (params.isValid()) {
      throw InvalidLoginParams();
    }

    final user = await _repository.loginUser(params: params);

    return user;
  }
}
