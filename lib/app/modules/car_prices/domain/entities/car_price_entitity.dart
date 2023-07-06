// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:precio_medio_paraguay/app/core/common/address.dart';
import 'package:precio_medio_paraguay/app/core/common/coordinates.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_fuel_type_enum.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_gear_enum.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_sale_type_enum.dart';

class CarPriceEntity {
  final String? uid;
  final String car;
  final Address address;
  final Coordinates coordinates;
  final CarSaleTypeENUM carSaleType;
  final double price;
  final String year;
  final String color;
  final CarFuelTypeENUM fuel;
  final CarGearTypeENUM gear;
  final DateTime registeredAt;
  final DateTime? lastUpdate;

  final String informedBy;
  final bool active;
  CarPriceEntity({
    this.uid,
    required this.car,
    required this.address,
    required this.coordinates,
    required this.carSaleType,
    required this.price,
    required this.year,
    required this.color,
    required this.fuel,
    required this.gear,
    required this.registeredAt,
    this.lastUpdate,
    required this.informedBy,
    required this.active,
  });

  bool isValid() {
    return car.isNotEmpty &&
        address.isValid() &&
        validPrice() &&
        informedBy.isNotEmpty;
  }

  bool validPrice() {
    return price > 0.0;
  }

  bool hasDateRangeValid() {
    if (lastUpdate == null) {
      return true;
    }
    return lastUpdate!.isAfter(registeredAt);
  }

  @override
  String toString() {
    return 'CarPriceEntity(uid: $uid, car: $car, address: $address, coordinates: $coordinates, carSaleType: $carSaleType, price: $price, registeredAt: $registeredAt, lastUpdate: $lastUpdate, informeBy: $informedBy, active: $active)';
  }
}
