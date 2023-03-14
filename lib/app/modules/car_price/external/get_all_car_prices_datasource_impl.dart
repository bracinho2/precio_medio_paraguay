import 'package:precio_medio_paraguay/app/modules/car_price/infra/datasource/get_all_car_prices_datasource.dart';

class GetAllCarPricesDatasourceImpl implements GetAllCarPricesDatasource {
  @override
  Future<List<Map<String, dynamic>>> call() async {
    return [
      {
        "id": "01",
        "car": "Vios",
        "departamento": "14",
        "municipio": "79",
        "saleType": "private",
        "price": "10000",
      },
       {
        "id": "01",
        "car": "Vios",
        "departamento": "14",
        "municipio": "79",
        "saleType": "private",
        "price": "10000",
      }
    ];
  }
}
