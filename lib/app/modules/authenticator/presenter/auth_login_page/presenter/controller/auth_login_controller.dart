import 'package:flutter/material.dart';

import 'package:precio_medio_paraguay/app/modules/authenticator/domain/usecases/login_user_usecase.dart';

import '../../../../../../core/services/local_cache_service/local_cache_service.dart';
import '../../../../domain/entities/user_login_params.dart';

class AuthLoginController {
  AuthLoginController(
    this._usecase,
    this._localCacheService,
  );

  final LoginUserUsecase _usecase;
  final LocalCacheService _localCacheService;

  final formKey = GlobalKey<FormState>();

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    if (formKey.currentState!.validate()) {
      final user = await _usecase.call(
        params: UserLoginParams(
          email: email,
          password: password,
        ),
      );
      if (user != null) {
        _localCacheService.saveLoggedUserUID(uid: user.uid!);
        return true;
      }
    }
    return false;
  }

  Future<bool> hasLoggedUser() async {
    return await _localCacheService.hasLoggedUser();
  }

  Future<bool> logout() async {
    return await _localCacheService.removeLoggedUserUID();
  }
}
