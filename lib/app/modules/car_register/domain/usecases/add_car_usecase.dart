import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/errors/errors.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/repositories/add_car_repository.dart';

import '../../../../core/errors/errors.dart';

abstract class AddCarUsecase {
  Future<Either<Failure, Unit>> call({
    required CarEntity car,
  });
}

class AddCar implements AddCarUsecase {
  final AddCarRepository _addCarRepository;

  AddCar(this._addCarRepository);
  @override
  Future<Either<Failure, Unit>> call({required CarEntity car}) async {
    if (car.hasError()) {
      return await _addCarRepository.call(car: car);
    }
    return Left(CarRegisterError(message: car.validate() ?? 'Add Car Error'));
  }
}
