import 'package:precio_medio_paraguay/app/core/value_objects/price_vo.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/repositories/add_car_price_repository.dart';

abstract class AddCarPriceUsecase {
  Future<bool> call({required PriceUSD price});
}

class AddCarPrice implements AddCarPriceUsecase {
  final AddCarPriceRepository _addCarPriceRepository;

  AddCarPrice(this._addCarPriceRepository);
  @override
  Future<bool> call({required PriceUSD price}) async {
    return await _addCarPriceRepository.call(price: price);
  }
}
