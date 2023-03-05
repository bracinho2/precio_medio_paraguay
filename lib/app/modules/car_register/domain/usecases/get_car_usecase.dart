import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/core/errors/errors.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/repositories/get_car_repository.dart';

abstract class GetCarUsecase {
  Future<Either<Failure, CarEntity>> call({required String carID});
}

class GetCar implements GetCarUsecase {
  final GetCarRepository _getCarRepository;

  GetCar(this._getCarRepository);
  @override
  Future<Either<Failure, CarEntity>> call({required String carID}) async {
    return _getCarRepository.call(carID: carID);
  }
}
