import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/entities/car_price_entitity.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/errors/errors.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/repositories/add_car_price_repository.dart';

import '../../../../core/errors/errors.dart';

abstract class AddCarPriceUsecase {
  Future<Either<Failure, Unit>> call({required CarPriceEntity carPriceEntity});
}

class AddCarPrice implements AddCarPriceUsecase {
  final AddCarPriceRepository _addCarPriceRepository;

  AddCarPrice(this._addCarPriceRepository);
  @override
  Future<Either<Failure, Unit>> call(
      {required CarPriceEntity carPriceEntity}) async {
    if (carPriceEntity.hasError()) {
      return await _addCarPriceRepository.call(carPriceEntity: carPriceEntity);
    }
    return Left(CarPriceError(message: carPriceEntity.validade() ?? 'Add Car Price Error'));
  }
}
