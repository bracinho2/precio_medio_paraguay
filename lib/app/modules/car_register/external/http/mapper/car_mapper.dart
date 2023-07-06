import 'dart:developer';

import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/errors/errors.dart';

import '../../../../../core/common/coordinates.dart';

class CarMapper {
  static CarEntity fromMap(Map<String, dynamic> map) {
    try {
      return CarEntity(
        uid: map['uid'],
        model: map['model'],
        manufacturer: map['manufacturer'],
        year: map['year'],
        fuel: map['fuel'],
        gear: map['gear'],
        color: map['color'],
        coordinates: latLangFromMap(map['coordinates']),
        registeredAt: DateTime.fromMillisecondsSinceEpoch(map['registeredAt']),
        lastUpdate: map['lastUpdate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['lastUpdate'])
            : null,
        informedBy: map['informedBy'],
        active: map['active'],
      );
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw CarMapperError();
    }
  }

  static Coordinates latLangFromMap(Map<String, dynamic> map) {
    return Coordinates(latitude: map['latitude'], longitude: map['longitude']);
  }

  static Map<String, dynamic> toMap({required CarEntity car}) {
    try {
      return {
        'uid': car.uid,
        'manufacturer': car.manufacturer,
        'model': car.model,
        'year': car.year,
        'fuel': car.fuel,
        'gear': car.gear,
        'color': car.color,
        'coordinates': {
          'latitude': car.coordinates.latitude,
          'longitude': car.coordinates.longitude,
        },
        'registeredAt': car.registeredAt.millisecondsSinceEpoch,
        'lastUpdate': car.lastUpdate?.millisecondsSinceEpoch,
        'informedBy': car.informedBy,
        'active': car.active,
      };
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw CarMapperError();
    }
  }
}
