import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/repositories/get_all_cars_repository.dart';

import '../../../../core/errors/errors.dart';

abstract class GetAllCarsUsecase {
  Future<Either<Failure, List<CarEntity>>> call();
}

class GetAllCars implements GetAllCarsUsecase {
  final GetAllCarsRepository _allCarsRepository;

  GetAllCars(this._allCarsRepository);
  @override
  Future<Either<Failure, List<CarEntity>>> call() async {
    return await _allCarsRepository.call();
  }
}
