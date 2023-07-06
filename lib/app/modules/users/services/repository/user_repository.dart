import 'package:precio_medio_paraguay/app/core/services/firestore/remote_storage_service_interface.dart';

import '../adapter/user_mapper.dart';
import '../../core/typedef/results_module.dart';

abstract class UserRepository {
  Future<UsersResult> getAll();
}

class GetAllUsers implements UserRepository {
  final IRemoteStorage _iRemoteStorage;

  GetAllUsers(this._iRemoteStorage);

  @override
  Future<UsersResult> getAll() async {
    final response = await _iRemoteStorage.getAll(collectionPath: 'users');

    return response.map((map) => UserMapper.fromMap(map)).toList();
  }
}
