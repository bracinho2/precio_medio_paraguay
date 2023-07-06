import 'dart:developer';

import 'package:precio_medio_paraguay/app/core/services/firestore/remote_storage_service_interface.dart';
import 'package:precio_medio_paraguay/app/modules/admin_area/core/typedef/typedef.dart';
import 'package:precio_medio_paraguay/app/modules/admin_area/model/admin_user_model.dart';

import '../core/error/admin_errors.dart';

abstract class IAdminAreaRepository {
  Future<AdminLoginResult> login({required AdminLoginParamsData params});
}

class AdminAreaRepository implements IAdminAreaRepository {
  final IRemoteStorage _iRemoteStorage;

  AdminAreaRepository(this._iRemoteStorage);
  @override
  Future<AdminLoginResult> login({required AdminLoginParamsData params}) async {
    try {
      final result = await _iRemoteStorage.login(map: {
        "login": params.email,
        "password": params.password,
      }, collectionPath: 'admin');
      return AdminUserModel.fromMap(result);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw AdminUserNotFound();
    }
  }
}
