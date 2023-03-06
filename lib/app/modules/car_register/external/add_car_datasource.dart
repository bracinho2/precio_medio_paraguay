import 'package:precio_medio_paraguay/app/modules/car_register/infra/datasources/add_car_datasource.dart';

class AddCarDatasourceImpl implements AddCarDatasource{
  @override
  Future<bool> call({required Map<String, dynamic> car}) async {
    return true;
  }
}