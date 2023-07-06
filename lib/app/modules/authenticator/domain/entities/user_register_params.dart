import 'package:precio_medio_paraguay/app/core/common/address.dart';
import 'package:precio_medio_paraguay/app/core/common/coordinates.dart';

class UserParamsEntity {
  UserParamsEntity({
    this.uid,
    required this.name,
    required this.identify,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
    required this.coordinates,
    required this.registeredAt,
    this.lastUpdate,
  });
  String? uid;
  String name;
  String identify;
  String email;
  String password;
  String phone;
  Address address;
  Coordinates coordinates;
  DateTime registeredAt;
  DateTime? lastUpdate;

  factory UserParamsEntity.isEmpty() {
    return UserParamsEntity(
      uid: '',
      name: '',
      identify: '',
      email: '',
      password: '',
      phone: '',
      address: Address.isEmpty(),
      coordinates: Coordinates.isEmpty(),
      registeredAt: DateTime.now(),
    );
  }

  bool isValid() {
    return name.isNotEmpty &&
        identify.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty;
  }

  @override
  String toString() {
    return 'UserRegisterParamsEntity(name: $name, identify: $identify, email: $email, password: $password, phone: $phone, registeredAt: $registeredAt)';
  }
}
