import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/repositories/update_car_repository.dart';

import '../../../../core/errors/errors.dart';

abstract class UpdateCarUsecase {
  Future<Either<Failure, Unit>> call({required CarEntity car});
}

class UpdateCar implements UpdateCarUsecase {
  final UpdateCarRepository _updateCarRepository;

  UpdateCar(this._updateCarRepository);
  @override
  Future<Either<Failure, Unit>> call({required CarEntity car}) async {
    return await _updateCarRepository.call(car: car);
  }
}
