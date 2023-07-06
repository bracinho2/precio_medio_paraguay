import '../../core/typedef/typedef.dart';
import '../../domain/entities/car_entity.dart';

abstract class CarDatasource {
  Future<AddCarResult> addCar({required CarEntity car});
  Future<GetAllCarsResult> getAllCars();
  Future<GetCarByIdResult> getCarByID({required String uid});
  Future<UpdateCarResult> updateCar({required CarEntity car});
  Future<RemoveResult> removeCar({required String uid});
}
