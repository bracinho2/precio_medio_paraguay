import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_params.dart';

import '../../../../core/common/coordinates.dart';

class CarEntity {
  final String? uid;
  final String manufacturer;
  final String model;
  final String year;
  final String color;
  final String fuel;
  final String gear;
  final Coordinates coordinates;
  final DateTime registeredAt;
  final DateTime? lastUpdate;
  final String informedBy;
  final bool active;
  CarEntity({
    this.uid,
    required this.manufacturer,
    required this.model,
    required this.year,
    required this.fuel,
    required this.gear,
    required this.color,
    required this.coordinates,
    required this.registeredAt,
    this.lastUpdate,
    required this.informedBy,
    required this.active,
  });

  factory CarEntity.isEmpty() {
    return CarEntity(
      model: '',
      manufacturer: '',
      year: '',
      fuel: '',
      gear: '',
      color: '',
      registeredAt: DateTime(1970),
      coordinates: Coordinates.isEmpty(),
      informedBy: '',
      active: true,
    );
  }

  bool isValid() {
    return model.isNotEmpty &&
        manufacturer.isNotEmpty &&
        year.isNotEmpty &&
        fuel.isNotEmpty &&
        gear.isNotEmpty &&
        color.isNotEmpty &&
        hasDateRangeValid() &&
        informedBy.isNotEmpty;
  }

  bool hasDateRangeValid() {
    if (lastUpdate == null) {
      return true;
    }
    return lastUpdate!.isAfter(registeredAt);
  }

  factory CarEntity.fromParams({required CarParams params}) {
    return CarEntity(
      model: params.model,
      manufacturer: params.manufacturer,
      year: params.year,
      fuel: params.fuel,
      gear: params.gear,
      color: params.color,
      coordinates: params.coordinates,
      registeredAt: params.registeredAt,
      lastUpdate: params.lastUpdate,
      informedBy: params.informedBy,
      active: params.active,
    );
  }

  @override
  String toString() {
    return 'CarEntity(uid: $uid, manufacturer: $manufacturer, model: $model, year: $year, color: $color, fuel: $fuel, gear: $gear, coordinates: $coordinates, registeredAt: $registeredAt, lastUpdate: $lastUpdate, informedBy: $informedBy, active: $active)';
  }
}
