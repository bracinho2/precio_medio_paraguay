import 'package:precio_medio_paraguay/app/modules/car_prices/core/typedef/typedef.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/repositories/car_price_repository.dart';

abstract class RemoveCarPriceUsecase {
  Future<RemoveCarPriceResult> call({required String uid});
}

class RemoveCarPrice implements RemoveCarPriceUsecase {
  final CarPriceRepository _repository;

  RemoveCarPrice(this._repository);

  @override
  Future<RemoveCarPriceResult> call({required String uid}) async {
    return await _repository.removePrice(uid: uid);
  }
}
