
import 'car_model_entity.dart';

class CarManufacturerEntity {
  final String? uid;
  final String name;
  final List<CarModelEntity> models;

  CarManufacturerEntity({
    this.uid,
    required this.name,
    required this.models,
  });

  @override
  String toString() =>
      'CarManufacturerEntity(uid: $uid, name: $name, models: $models)';
}
