// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:precio_medio_paraguay/app/core/services/firestore/remote_storage_service_interface.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/core/typedef/typedef.dart';
import 'package:precio_medio_paraguay/app/modules/users/model/user_entity.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/domain/entities/user_login_params.dart';
import 'package:precio_medio_paraguay/app/modules/authenticator/infra/datasource/auth_datasource.dart';

import '../../domain/errors/user_error.dart';
import 'mappers/user_mapper.dart';

class FireaseAuthDatasourceImpl implements AuthDatasource {
  final IRemoteStorage _storage;
  FireaseAuthDatasourceImpl(
    this._storage,
  );
  @override
  Future<GetUserByIdResult?> getUserById({required String uid}) async {
    try {
      final response = await _storage.getByID(id: uid, collectionPath: 'users');
      if (response == null) {
        throw NotFoundUser();
      }

      return UserMapper.fromMap(response);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return null;
    }
  }

  @override
  Future<LoginResult?> loginUser({required UserLoginParams params}) async {
    try {
      final response = await _storage.login(map: {
        'email': params.email,
        'password': params.password,
      }, collectionPath: 'users');

      return UserMapper.fromMap(response);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return null;
    }
  }

  @override
  Future<RegisterUserResult> registerUser({required UserEntity user}) async {
    try {
      return await _storage.addItem(
          map: UserMapper.toMap(user), collectionPath: 'users');
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw CantRegisterUser();
    }
  }

  @override
  Future<UpdateUserResult> updateUser({required UserEntity user}) async {
    try {
      return await _storage.updateItem(
          map: UserMapper.toMap(user), collectionPath: 'users');
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw CantUpdateUser();
    }
  }
}
