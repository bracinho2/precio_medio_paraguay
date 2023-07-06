import 'package:precio_medio_paraguay/app/core/common/address.dart';

import '../../../../core/common/coordinates.dart';

class AdminCarPriceParams {
  String? uid;
  String car;
  Address address;
  Coordinates coordinates;
  String carSaleType;
  double price;
  String year;
  String color;
  String carFuelType;
  String carGearType;
  DateTime registeredAt;
  DateTime? lastUpdate;
  String informedBy;
  bool active;
  AdminCarPriceParams({
    this.uid,
    required this.car,
    required this.address,
    required this.coordinates,
    required this.carSaleType,
    required this.price,
    required this.year,
    required this.color,
    required this.carFuelType,
    required this.carGearType,
    required this.registeredAt,
    this.lastUpdate,
    required this.informedBy,
    required this.active,
  });

  factory AdminCarPriceParams.isEmpty() {
    return AdminCarPriceParams(
      uid: '',
      car: '',
      address: Address.isEmpty(),
      coordinates: Coordinates.isEmpty(),
      carSaleType: '',
      price: 0.0,
      year: '',
      color: '',
      carFuelType: '',
      carGearType: '',
      registeredAt: DateTime(1970),
      informedBy: '',
      active: true,
    );
  }

  @override
  String toString() {
    return 'AdminCarPriceParams(uid: $uid, car: $car, address: $address, coordinates: $coordinates, carSaleType: $carSaleType, price: $price, year: $year, color: $color, carFuelType: $carFuelType, carGearType: $carGearType, registeredAt: $registeredAt, lastUpdate: $lastUpdate, informedBy: $informedBy, active: $active)';
  }
}
