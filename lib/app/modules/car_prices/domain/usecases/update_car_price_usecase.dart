import 'package:precio_medio_paraguay/app/modules/car_prices/core/typedef/typedef.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/entities/car_price_entitity.dart';

import 'package:precio_medio_paraguay/app/modules/car_prices/domain/repositories/car_price_repository.dart';

abstract class UpdateCarPriceUsecase {
  Future<RemoveCarPriceResult> call({required CarPriceEntity price});
}

class UpdateCarPrice implements UpdateCarPriceUsecase {
  final CarPriceRepository _repository;

  UpdateCarPrice(this._repository);
  @override
  Future<RemoveCarPriceResult> call({required CarPriceEntity price}) async {
    return await _repository.updatePrice(price: price);
  }
}
