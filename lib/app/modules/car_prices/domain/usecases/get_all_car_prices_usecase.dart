import 'package:precio_medio_paraguay/app/modules/car_prices/core/typedef/typedef.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/repositories/car_price_repository.dart';

abstract class GetAllCarsPricesUsecase {
  Future<ListCarPriceResult> call();
}

class GetAllCarPrices implements GetAllCarsPricesUsecase {
  final CarPriceRepository _getAllCarsRepository;

  GetAllCarPrices(this._getAllCarsRepository);

  @override
  Future<ListCarPriceResult> call() async {
    return _getAllCarsRepository.getPrices();
  }
}
