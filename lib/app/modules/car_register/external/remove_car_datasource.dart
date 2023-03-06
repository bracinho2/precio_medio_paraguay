
import 'package:precio_medio_paraguay/app/modules/car_register/infra/datasources/remove_car_datasource.dart';

class RemoveCarDatasourceImpl  implements RemoveCarDatasource{
  @override
  Future<bool> call({required String carID}) async {
   return true;
  }
}