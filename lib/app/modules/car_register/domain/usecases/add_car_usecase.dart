import 'package:precio_medio_paraguay/app/modules/car_register/core/typedef/typedef.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/errors/errors.dart';

import '../repositories/car_repository.dart';

abstract class AddCarUsecase {
  Future<AddCarResult> call({
    required CarEntity car,
  });
}

class AddCar implements AddCarUsecase {
  final CarRepository _repository;

  AddCar(this._repository);
  @override
  Future<AddCarResult> call({
    required CarEntity car,
  }) async {
    if (car.isValid()) {
      return await _repository.addCar(car: car);
    }
    throw InvalidCar();
  }
}
