import '../../core/typedef/typedef.dart';
import '../../../users/model/user_entity.dart';
import '../entities/user_login_params.dart';

abstract class AuthRepository {
  Future<RegisterUserResult> registerUser({required UserEntity user});

  Future<GetUserByIdResult> getUserById({required String uid});

  Future<UpdateUserResult> updateUser({required UserEntity user});

  Future<LoginResult?> loginUser({required UserLoginParams params});
}
