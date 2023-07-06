import 'package:precio_medio_paraguay/app/modules/car_register/core/typedef/typedef.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/repositories/car_repository.dart';

abstract class UpdateCarUsecase {
  Future<UpdateCarResult> call({required CarEntity car});
}

class UpdateCar implements UpdateCarUsecase {
  final CarRepository _repository;

  UpdateCar(this._repository);
  @override
  Future<UpdateCarResult> call({required CarEntity car}) async {
    return await _repository.updateCar(car: car);
  }
}
