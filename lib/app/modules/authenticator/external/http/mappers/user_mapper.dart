import 'dart:developer';

import 'package:precio_medio_paraguay/app/core/common/address.dart';
import 'package:precio_medio_paraguay/app/core/common/coordinates.dart';

import '../../../../users/model/user_entity.dart';
import '../../../domain/errors/user_error.dart';

class UserMapper {
  static Map<String, dynamic> toMap(UserEntity entity) {
    try {
      return {
        'uid': entity.uid,
        'name': entity.name,
        'email': entity.email,
        'identify': entity.identify,
        'password': entity.password,
        'phone': entity.phone,
        'address': {
          'departament': entity.address?.departament,
          'city': entity.address?.city,
        },
        'coordinates': {
          'latitude': entity.coordinates.latitude,
          'longitude': entity.coordinates.longitude,
        },
        'registeredAt': entity.registeredAt.millisecondsSinceEpoch,
        'lastUpdate': entity.lastUpdate?.millisecondsSinceEpoch,
        'active': entity.active,
      };
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw ParseError();
    }
  }

  static UserEntity fromMap(Map<String, dynamic> json) {
    try {
      return UserEntity(
        uid: json['uid'],
        name: json['name'],
        identify: json['identify'],
        email: json['email'],
        password: json['password'],
        phone: json['phone'],
        address: addressFromMap(json['address']),
        coordinates: Coordinates(
            latitude: json['latitude'] ?? '',
            longitude: json['longitude'] ?? ''),
        registeredAt: DateTime.fromMillisecondsSinceEpoch(json['registeredAt']),
        lastUpdate: json['lastUpdate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(json['lastUpdate'])
            : null,
        active: json['active'],
      );
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw ParseError();
    }
  }

  static Address addressFromMap(Map<String, dynamic> map) {
    return Address(departament: map['departament'], city: map['city']);
  }
}
