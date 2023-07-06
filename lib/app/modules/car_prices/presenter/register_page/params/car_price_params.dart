import '../../../../../core/common/address.dart';
import '../../../../../core/common/coordinates.dart';

class CarPriceParams {
  String uid;
  String car;
  Address address;
  Coordinates coordinates;
  String carSaleType;
  double price;
  String year;
  String color;
  String fuel;
  String gear;
  DateTime registeredAt;
  DateTime? lastUpdate;
  String informedBy;
  bool active;
  CarPriceParams({
    required this.uid,
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

  factory CarPriceParams.isEmpty() {
    return CarPriceParams(
      uid: '',
      car: '',
      address: Address.isEmpty(),
      coordinates: Coordinates.isEmpty(),
      carSaleType: '',
      price: 0.0,
      year: '',
      color: '',
      fuel: '',
      gear: '',
      registeredAt: DateTime.now(),
      informedBy: '',
      active: true,
    );
  }

  @override
  String toString() {
    return 'CarPriceParams(uid: $uid, car: $car, address: $address, coordinates: $coordinates, carSaleType: $carSaleType, price: $price, year: $year, color: $color, fuel: $fuel, gear: $gear, registeredAt: $registeredAt, lastUpdate: $lastUpdate, informedBy: $informedBy, active: $active)';
  }
}
