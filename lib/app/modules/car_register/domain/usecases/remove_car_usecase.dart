import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/repositories/remove_car_repository.dart';

import '../../../../core/errors/errors.dart';

abstract class AddCarUsecase {
  Future<Either<Failure, Unit>> call({
    required String carID,
  });
}

class AddCar implements AddCarUsecase {
  final RemoveCarRepository _removeCarRepository;

  AddCar(this._removeCarRepository);
  @override
  Future<Either<Failure, Unit>> call({required String carID}) async {
    return await _removeCarRepository.call(carID: carID);
  }
}
