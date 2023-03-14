import 'package:precio_medio_paraguay/app/modules/car_register/infra/datasources/update_car_datasource.dart';

class UpdateCarDatasourceImpl implements UpdateCarDatasource {
  @override
  Future<bool> call({required Map<String, dynamic> car}) async {
    return true;
  }
}
