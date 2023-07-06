import 'dart:developer';

import 'package:precio_medio_paraguay/app/core/common/coordinates.dart';

import '../../core/errors/user_errors.dart';
import '../../model/user_entity.dart';

class UserMapper {
  static UserEntity fromMap(Map<String, dynamic> map) {
    try {
      return UserEntity(
        uid: map['uid'],
        name: map['name'],
        identify: map['identify'],
        email: map['email'],
        password: map['password'],
        coordinates: coordinatesFromMap(map['coordinates']),
        phone: map['phone'],
        registeredAt: DateTime.fromMillisecondsSinceEpoch(map['registeredAt']),
      );
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw AdapterError();
    }
  }

  static Coordinates coordinatesFromMap(Map<String, dynamic> map) {
    try {
      return Coordinates(
          latitude: map['latitude'] ?? '', longitude: map['longitude'] ?? '');
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw AdapterError();
    }
  }
}
