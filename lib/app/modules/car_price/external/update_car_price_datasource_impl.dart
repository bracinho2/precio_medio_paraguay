import 'package:precio_medio_paraguay/app/modules/car_price/infra/datasource/update_car_price_datasource.dart';

class UpdateCarPriceDatasourceImpl implements UpdateCarPriceDatasource {
  @override
  Future<bool> call({required Map<String, dynamic> carPriceEntity}) async {
    return true;
  }
}
