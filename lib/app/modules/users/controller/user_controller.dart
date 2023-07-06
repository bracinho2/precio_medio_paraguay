import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:precio_medio_paraguay/app/modules/users/core/typedef/results_module.dart';

import '../core/errors/user_errors.dart';
import '../services/repository/user_repository.dart';
import '../view/states/user_states.dart';

class UserController extends ValueNotifier<UserState> {
  final UserRepository _repository;

  UserController(this._repository) : super(UserLoadingState());

  Future<UsersResult> getAllUsers() async {
    try {
      return await _repository.getAll();
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw ListUserNotFound();
    }
  }
}
