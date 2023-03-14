import 'package:precio_medio_paraguay/app/modules/car_register/infra/datasources/get_car_datasource.dart';

class GetCarDatasourceImpl implements GetCarDatasource {
  @override
  Future<Map<String, dynamic>> call({required String carID}) async {
    return {
      "id": "01",
      "name": "Premio",
      "manufacturer": "Toyota",
      "year": "2004",
      "color": "Negro",
      "saleType": "private",
      "municipio": "79",
      "departamento": "14",
      "informedAt": "2023-03-06 16: 32: 00.000Z",
      "updateAt": "2023-03-06 16: 32: 00.000Z",
      "informedByID": "01"
    };
  }
}
