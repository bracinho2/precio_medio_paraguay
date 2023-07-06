import 'package:precio_medio_paraguay/app/core/common/coordinates.dart';

import '../../../core/common/address.dart';
import '../../authenticator/domain/entities/user_register_params.dart';

class UserEntity {
  final String? uid;
  final String name;
  final String identify;
  final String email;
  final String password;
  final String phone;
  final Address? address;
  final Coordinates coordinates;
  final DateTime registeredAt;
  final DateTime? lastUpdate;
  final bool active;
  const UserEntity({
    this.uid,
    required this.name,
    required this.identify,
    required this.email,
    required this.password,
    required this.phone,
    this.address,
    required this.coordinates,
    required this.registeredAt,
    this.lastUpdate,
    this.active = true,
  });

  bool isValid() {
    return name.isNotEmpty &&
        isIdentifyValid() &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        phone.isNotEmpty &&
        isEmailValid() &&
        hasDateRangeValid();
  }

  bool isIdentifyValid() {
    return true;
  }

  bool isEmailValid() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  bool isAddressValid() {
    final value = address;
    if (value != null) {
      return value.isValid();
    }
    return false;
  }

  bool isCoordinatesValid() {
    final value = coordinates;

    return value.isValid();
  }

  bool hasDateRangeValid() {
    if (lastUpdate == null) {
      return true;
    }
    return lastUpdate!.isAfter(registeredAt);
  }

  factory UserEntity.fromParams({required UserParamsEntity params}) {
    return UserEntity(
      uid: params.uid,
      name: params.name,
      identify: params.identify,
      email: params.email,
      password: params.password,
      phone: params.phone,
      address: Address(
        departament: params.address.departament,
        city: params.address.city,
      ),
      coordinates: Coordinates(
        latitude: params.coordinates.latitude,
        longitude: params.coordinates.longitude,
      ),
      registeredAt: params.registeredAt,
      lastUpdate: params.lastUpdate,
    );
  }

  @override
  String toString() {
    return 'UserEntity(uid: $uid, name: $name, identify: $identify, email: $email, password: $password, phone: $phone, address: $address, coordinates: $coordinates, registeredAt: $registeredAt, lastUpdate: $lastUpdate, active: $active)';
  }
}
