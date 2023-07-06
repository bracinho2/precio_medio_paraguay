import 'package:precio_medio_paraguay/app/modules/car_register/core/typedef/typedef.dart';

import 'package:precio_medio_paraguay/app/modules/car_register/domain/repositories/car_repository.dart';

abstract class GetAllCarsUsecase {
  Future<GetAllCarsResult> call();
}

class GetAllCars implements GetAllCarsUsecase {
  final CarRepository _repository;

  GetAllCars(this._repository);
  @override
  Future<GetAllCarsResult> call() async {
    return await _repository.getAllCars();
  }
}
