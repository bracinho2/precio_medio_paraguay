import 'package:precio_medio_paraguay/app/modules/car_prices/domain/entities/car_price_entitity.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/errors/errors.dart';

import '../../core/typedef/typedef.dart';
import '../repositories/car_price_repository.dart';

abstract class AddCarPriceUsecase {
  Future<AddCarPriceResult> call({required CarPriceEntity price});
}

class AddCarPrice implements AddCarPriceUsecase {
  final CarPriceRepository _addCarPriceRepository;

  AddCarPrice(this._addCarPriceRepository);
  @override
  Future<AddCarPriceResult> call({required CarPriceEntity price}) async {
    if (!price.isValid()) {
      throw InvalidPrice();
    }

    return await _addCarPriceRepository.addPrice(price: price);
  }
}
