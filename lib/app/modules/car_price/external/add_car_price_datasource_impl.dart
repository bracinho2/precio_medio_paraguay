import 'package:precio_medio_paraguay/app/modules/car_price/infra/datasource/add_car_price_datasource.dart';

class AddCarPriceDatasourceImpl implements AddCarPriceDatasource {
  @override
  Future<bool> call({required Map<String, dynamic> carPrice}) async {
    return true;
  }
}
