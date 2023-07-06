import '../../core/typedef/typedef.dart';
import '../../domain/entities/car_price_entitity.dart';

abstract class CarPriceDatasource {
  Future<ListCarPriceResult> getPrices();
  Future<GetPriceResult> getPrice({required String uid});
  Future<AddCarPriceResult> addPrice({required CarPriceEntity price});
  Future<UpdateCarPriceResult> updatePrice({required CarPriceEntity price});
  Future<RemoveCarPriceResult> removePrice({required String uid});
}
