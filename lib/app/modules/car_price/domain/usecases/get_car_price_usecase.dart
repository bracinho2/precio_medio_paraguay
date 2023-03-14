import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/core/errors/errors.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/entities/car_price_entitity.dart';

import '../repositories/get_car_price_repository.dart';

abstract class GetCarPriceUsecase {
  Future<Either<Failure, CarPriceEntity>> call(
      {required String carPriceEntityID});
}

class GetCarPrice implements GetCarPriceUsecase {
  final GetCarPriceRepository _getCarPriceRepository;

  GetCarPrice(this._getCarPriceRepository);
  @override
  Future<Either<Failure, CarPriceEntity>> call(
      {required String carPriceEntityID}) async {
    return _getCarPriceRepository.call(carPriceID: carPriceEntityID);
  }
}
