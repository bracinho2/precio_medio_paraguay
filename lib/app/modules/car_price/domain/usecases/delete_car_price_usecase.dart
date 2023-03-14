import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/core/errors/errors.dart';

import '../repositories/delete_car_price_repository.dart';

abstract class DeleteCarPriceUsecase {
  Future<Either<Failure, Unit>> call({required String carPriceID});
}

class DeleteCarPrice implements DeleteCarPriceUsecase {
  final DeleteCarPriceRepository _deleteCarPriceRepository;

  DeleteCarPrice(this._deleteCarPriceRepository);
  @override
  Future<Either<Failure, Unit>> call({required String carPriceID}) async {
    return await _deleteCarPriceRepository.call(carPriceID: carPriceID);
  }
}
