import 'package:precio_medio_paraguay/app/core/pocketbase/pb_urls.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/errors/errors.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/infra/datasources/get_all_cars.datasource.dart';

import '../../../core/api_provider/api_provider.dart';

class GetAllCarsDatasourceImpl implements GetAllCarsDatasource {
  final ApiBuilder _apiBuilder;

  GetAllCarsDatasourceImpl(this._apiBuilder);
  @override
  Future<List<Map<String, dynamic>>> call() async {
    try {
      final result = await _apiBuilder.get(baseUrl: PocketBaseUrl.GET_CARS_URL);

      final values = List<Map<String, dynamic>>.from(result.data['items']);

      return values;
    } catch (e, s) {
      throw CarRegisterDatasourceError(
        message: e.toString(),
        stackTrace: s,
      );
    }
  }
}

final dummyCars = [
  {
    "id": "01",
    "name": "Corolla",
    "manufacturer": "Toyota",
    "year": "2004",
    "gear": "MANUAL",
    "color": "Negro",
    "saleType": "PRIVATE",
    "municipio": "79",
    "departamento": "14",
    "informedAt": "2023-03-07T10:57:00-0300",
    "updateAt": "2023-03-07T10:57:00-0300",
    "informedByID": "01"
  },
  {
    "id": "01",
    "name": "Corolla",
    "manufacturer": "Toyota",
    "year": "2010",
    "gear": "AUTOMATIC",
    "color": "Negro",
    "saleType": "RESALE",
    "municipio": "79",
    "departamento": "14",
    "informedAt": "2023-03-07T10:57:00-0300",
    "updateAt": "2023-03-07T10:57:00-0300",
    "informedByID": "01"
  },
];
