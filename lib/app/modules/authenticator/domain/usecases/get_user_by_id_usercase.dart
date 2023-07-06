import 'package:precio_medio_paraguay/app/modules/users/model/user_entity.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/domain/repository/auth_repository.dart';

import '../errors/user_error.dart';

abstract class GetUserByIdUsecase {
  Future<UserEntity> call({required String uid});
}

class GetUserByID implements GetUserByIdUsecase {
  final AuthRepository _authRepository;

  GetUserByID(this._authRepository);
  @override
  Future<UserEntity> call({required String uid}) async {
    final result = await _authRepository.getUserById(uid: uid);

    if (result == null) {
      throw NotFoundUser();
    }
    return result;
  }
}
