import 'dart:developer';

import 'package:precio_medio_paraguay/app/core/enums/car_fuel_type_enum.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_gear_enum.dart';
import 'package:precio_medio_paraguay/app/core/enums/car_sale_type_enum.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/entities/car_price_entitity.dart';

import '../../../../core/common/address.dart';
import '../../../../core/common/coordinates.dart';
import '../../domain/errors/errors.dart';

class CarPriceMapper {
  static CarPriceEntity fromMap({required Map<String, dynamic> map}) {
    try {
      return CarPriceEntity(
        uid: map['uid'],
        car: map['car'],
        address: addressFromMap(map['address']),
        coordinates: coordinatesFromMap(map['coordinates']),
        carSaleType: CarSaleTypeENUM.fromString(map['carSaleType']),
        price: double.parse(map['price']),
        year: map['year'],
        color: map['color'],
        fuel: CarFuelTypeENUM.fromString(map['carFuelType']),
        gear: CarGearTypeENUM.fromString(map['carGearType']),
        registeredAt: DateTime.fromMillisecondsSinceEpoch(map['registeredAt']),
        informedBy: map['informedBy'],
        active: map['active'],
      );
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw ParsePriceError();
    }
  }

  static Coordinates coordinatesFromMap(Map<String, dynamic> map) {
    try {
      return Coordinates(
          latitude: map['latitude'], longitude: map['longitude']);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw ParsePriceError();
    }
  }

  static Address addressFromMap(Map<String, dynamic> map) {
    try {
      return Address(departament: map['departament'], city: map['city']);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw ParsePriceError();
    }
  }

  static Map<String, dynamic> toMap({required CarPriceEntity price}) {
    return {
      "uid": price.uid,
      "car": price.car,
      "address": {
        "departament": price.address.departament,
        "city": price.address.city,
      },
      "coordinates": {
        "latitude": price.coordinates.latitude,
        "longitude": price.coordinates.longitude,
      },
      "carSaleType": price.carSaleType.name,
      "price": price.price.toString(),
      "year": price.year,
      "color": price.color,
      "carFuelType": price.fuel.name,
      "carGearType": price.gear.name,
      "registeredAt": price.registeredAt.millisecondsSinceEpoch,
      "informedBy": price.informedBy,
      "active": price.active,
    };
  }
}
