import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/core/errors/errors.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/entities/car_price_entitity.dart';

import '../repositories/get_all_car_prices_repository.dart';

abstract class GetAllCarsPricesUsecase {
  Future<Either<Failure, List<CarPriceEntity>>> call();
}

class GetAllCarPrices implements GetAllCarsPricesUsecase {
  final GetAllCarPricesRepository _getAllCarsRepository;

  GetAllCarPrices(this._getAllCarsRepository);

  @override
  Future<Either<Failure, List<CarPriceEntity>>> call() async {
    return _getAllCarsRepository.call();
  }
}
