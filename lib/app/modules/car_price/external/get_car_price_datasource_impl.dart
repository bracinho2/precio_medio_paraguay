import 'package:precio_medio_paraguay/app/modules/car_price/infra/datasource/get_car_price_datasource.dart';

class GetCarPriceDatasourceImpl implements GetCarPriceDatasource {
  @override
  Future<Map<String, dynamic>> call({required String carPriceID}) async {
    return {
      "id": "01",
      "car": "Vios",
      "departamento": "14",
      "municipio": "79",
      "saleType": "private",
      "price": "10000",
    };
  }
}
