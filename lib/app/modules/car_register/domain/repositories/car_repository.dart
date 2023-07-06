import 'package:precio_medio_paraguay/app/modules/car_register/core/typedef/typedef.dart';

import '../entities/car_entity.dart';

abstract class CarRepository {
  Future<AddCarResult> addCar({required CarEntity car});
  Future<GetAllCarsResult> getAllCars();
  Future<GetCarByIdResult> getCarByID({required String uid});
  Future<UpdateCarResult> updateCar({required CarEntity car});
  Future<RemoveResult> removeCar({required String uid});
}
