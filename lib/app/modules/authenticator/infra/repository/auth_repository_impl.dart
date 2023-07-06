import 'dart:developer';

import 'package:precio_medio_paraguay/app/modules/authenticator/domain/entities/user_login_params.dart';

import 'package:precio_medio_paraguay/app/modules/users/model/user_entity.dart';

import 'package:precio_medio_paraguay/app/modules/authenticator/core/typedef/typedef.dart';

import '../../domain/errors/user_error.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _authDatasource;

  AuthRepositoryImpl(this._authDatasource);
  @override
  Future<GetUserByIdResult?> getUserById({required String uid}) async {
    try {
      return await _authDatasource.getUserById(uid: uid);
    } on AuthenticatorError catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      rethrow;
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return null;
    }
  }

  @override
  Future<LoginResult?> loginUser({required UserLoginParams params}) async {
    try {
      final result = await _authDatasource.loginUser(params: params);
      if (result == null) {
        throw CantLoginUser();
      }
      return result;
    } on AuthenticatorError catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return null;
    }
    return null;
  }

  @override
  Future<RegisterUserResult> registerUser({required UserEntity user}) async {
    try {
      return await _authDatasource.registerUser(user: user);
    } on AuthenticatorError catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      rethrow;
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw CantRegisterUser();
    }
  }

  @override
  Future<UpdateUserResult> updateUser({required UserEntity user}) async {
    try {
      return await _authDatasource.updateUser(user: user);
    } on AuthenticatorError catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      rethrow;
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw CantUpdateUser();
    }
  }
}
