import '../../../../core/common/coordinates.dart';

class CarParams {
  String? uid;
  String manufacturer;
  String model;
  String year;
  String color;
  String fuel;
  String gear;
  Coordinates coordinates;
  DateTime registeredAt;
  DateTime? lastUpdate;
  String informedBy;
  bool active;
  CarParams({
    this.uid,
    required this.manufacturer,
    required this.model,
    required this.year,
    required this.color,
    required this.fuel,
    required this.gear,
    required this.coordinates,
    required this.registeredAt,
    this.lastUpdate,
    required this.informedBy,
    required this.active,
  });

  factory CarParams.isEmpty() {
    return CarParams(
      manufacturer: '',
      model: '',
      year: '',
      color: '',
      fuel: '',
      gear: '',
      registeredAt: DateTime.now(),
      coordinates: Coordinates(latitude: '', longitude: ''),
      lastUpdate: null,
      informedBy: '',
      active: true,
    );
  }

  @override
  String toString() {
    return 'CarParams(uid: $uid, manufacturer: $manufacturer, model: $model, year: $year, color: $color, fuel: $fuel, gear: $gear, coordinates: $coordinates, registeredAt: $registeredAt, lastUpdate: $lastUpdate, informedBy: $informedBy, active: $active)';
  }
}
