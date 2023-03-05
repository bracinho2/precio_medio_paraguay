import 'package:precio_medio_paraguay/app/core/value_objects/price_vo.dart';

abstract class AddCarPriceRepository {
  Future<bool> call({required PriceUSD price});
}
