import 'dart:developer';

import 'package:precio_medio_paraguay/app/modules/car_register/core/typedef/typedef.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/errors/errors.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/repositories/car_repository.dart';

import '../datasources/car_datasource.dart';

class CarRepositoryImpl implements CarRepository {
  final CarDatasource _datasource;

  CarRepositoryImpl(this._datasource);

  @override
  Future<AddCarResult> addCar({required CarEntity car}) async {
    try {
      return await _datasource.addCar(car: car);
    } on CarRegisterError catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      rethrow;
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw CantAddCar();
    }
  }

  @override
  Future<GetAllCarsResult> getAllCars() async {
    try {
      return await _datasource.getAllCars();
    } on CarRegisterError catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      rethrow;
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw CantGetAllCars();
    }
  }

  @override
  Future<GetCarByIdResult> getCarByID({required String uid}) async {
    try {
      return await _datasource.getCarByID(uid: uid);
    } on CarRegisterError catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      rethrow;
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return null;
    }
  }

  @override
  Future<UpdateCarResult> updateCar({required CarEntity car}) async {
    try {
      return await _datasource.updateCar(car: car);
    } on CarRegisterError catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      rethrow;
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw CantUpdateCar();
    }
  }

  @override
  Future<RemoveResult> removeCar({required String uid}) async {
    try {
      return await _datasource.removeCar(uid: uid);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw CantRemoveCar();
    }
  }
}
