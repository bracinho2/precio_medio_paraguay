import 'package:precio_medio_paraguay/app/modules/car_prices/domain/repositories/car_price_repository.dart';

import '../../core/typedef/typedef.dart';

abstract class GetCarPriceUsecase {
  Future<GetPriceResult> call({
    required String uid,
  });
}

class GetCarPrice implements GetCarPriceUsecase {
  final CarPriceRepository _getCarPriceRepository;

  GetCarPrice(this._getCarPriceRepository);
  @override
  Future<GetPriceResult> call({required String uid}) async {
    return _getCarPriceRepository.getPrice(uid: uid);
  }
}
