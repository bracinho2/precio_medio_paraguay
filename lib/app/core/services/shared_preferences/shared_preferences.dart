import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

abstract class ILocalStoragePreferences {
  Future<String?> load({required String key});
  void save({required String key, required String value});
  Future<bool> remove({required String key});
}

class LocalStoragePreferences implements ILocalStoragePreferences {
  LocalStoragePreferences();
  @override
  Future<String?> load({required String key}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey(key)) {
      final doc = sharedPreferences.get(key) as String;
      return doc;
    } else {
      return null;
    }
  }

  @override
  void save({required String key, required String value}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }

  @override
  Future<bool> remove({required String key}) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.remove(key);
      return true;
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return false;
    }
  }
}
