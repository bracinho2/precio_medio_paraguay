import 'dart:convert';

import '../../../modules/users/model/user_entity.dart';
import '../../../modules/authenticator/external/http/mappers/user_mapper.dart';
import '../shared_preferences/shared_preferences.dart';

class LocalCacheService {
  final ILocalStoragePreferences _iLocalStoragePreferences;
  LocalCacheService(
    this._iLocalStoragePreferences,
  );

  static const loggedUser = 'loggedUser';
  static const loggedUserUID = 'loggedUserUID';

  Future<void> saveLoggedUserUID({required String uid}) async {
    _iLocalStoragePreferences.save(key: loggedUserUID, value: uid);
  }

  Future<String?> loadLoggedUserUID() async {
    final result = await _iLocalStoragePreferences.load(key: loggedUserUID);
    if (result != null) {
      return result;
    }
    return null;
  }

  Future<bool> removeLoggedUserUID() async {
    return _iLocalStoragePreferences.remove(key: loggedUserUID);
  }

  Future<void> saveLoggedUser({required UserEntity user}) async {
    final userToString = json.encode(UserMapper.toMap(user));

    _iLocalStoragePreferences.save(key: loggedUser, value: userToString);
  }

  Future<UserEntity?> getLoggedUser() async {
    final result = await _iLocalStoragePreferences.load(key: loggedUser);
    if (result != null) {
      return UserMapper.fromMap(json.decode(result));
    }
    return null;
  }

  Future<bool> hasLoggedUser() async {
    final result = await _iLocalStoragePreferences.load(key: 'loggedUserUID');

    if (result != null) {
      return true;
    }
    return false;
  }
}
