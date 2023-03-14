import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/entities/car_price_entitity.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/repositories/update_car_price_repository.dart';

import '../../../../core/errors/errors.dart';

abstract class UpdateCarPriceUsecase {
  Future<Either<Failure, Unit>> call({required CarPriceEntity carPriceEntity});
}

class UpdateCarPrice implements UpdateCarPriceUsecase {
  final UpdateCarPriceRepository _updateCarPriceRepository;

  UpdateCarPrice(this._updateCarPriceRepository);
  @override
  Future<Either<Failure, Unit>> call(
      {required CarPriceEntity carPriceEntity}) async {
    return await _updateCarPriceRepository.call(carPriceEntity: carPriceEntity);
  }
}
