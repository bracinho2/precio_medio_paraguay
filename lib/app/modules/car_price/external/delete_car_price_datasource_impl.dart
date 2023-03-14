import 'package:precio_medio_paraguay/app/modules/car_price/infra/datasource/delete_car_price_datasource.dart';

class DeleteCarPriceDatasourceImpl implements DeleteCarPriceDatasource {
  @override
  Future<bool> call({required String carPriceID}) async {
    return true;
  }
}
