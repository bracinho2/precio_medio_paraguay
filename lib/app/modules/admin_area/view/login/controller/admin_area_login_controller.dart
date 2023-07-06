import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:precio_medio_paraguay/app/core/services/local_cache_service/local_cache_service.dart';

import 'package:precio_medio_paraguay/app/modules/admin_area/core/typedef/typedef.dart';
import 'package:precio_medio_paraguay/app/modules/admin_area/repository/admin_area_repository.dart';

import '../../../core/error/admin_errors.dart';

class AdminAreaLoginController {
  final IAdminAreaRepository _iAdminAreaRepository;
  final LocalCacheService _localCacheService;

  final formKey = GlobalKey<FormState>();

  AdminAreaLoginController(
    this._iAdminAreaRepository,
    this._localCacheService,
  );

  Future<bool> login({required String email, required String password}) async {
    try {
      if (formKey.currentState!.validate()) {
        final user = await _iAdminAreaRepository.login(
          params: AdminLoginParamsData(
            email: email,
            password: password,
          ),
        );

        if (user != null) {
          _localCacheService.saveLoggedUserUID(uid: user.userUID);
          return true;
        }
      }
    } on AdminError catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());

      return false;
    }
    return false;
  }
}
