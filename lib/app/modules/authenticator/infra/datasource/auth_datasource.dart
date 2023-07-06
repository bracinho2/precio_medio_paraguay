import '../../core/typedef/typedef.dart';
import '../../../users/model/user_entity.dart';
import '../../domain/entities/user_login_params.dart';

abstract class AuthDatasource {
  Future<RegisterUserResult> registerUser({required UserEntity user});

  Future<GetUserByIdResult> getUserById({required String uid});

  Future<UpdateUserResult> updateUser({required UserEntity user});

  Future<LoginResult?> loginUser({required UserLoginParams params});
}
