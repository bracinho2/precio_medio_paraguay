import 'dart:developer';

import 'package:precio_medio_paraguay/app/modules/car_register/core/typedef/typedef.dart';
import 'package:precio_medio_paraguay/app/modules/car_register/domain/entities/car_entity.dart';

import '../../../core/services/firestore/remote_storage_service_interface.dart';
import '../domain/errors/errors.dart';
import '../infra/datasources/car_datasource.dart';
import 'http/mapper/car_mapper.dart';

class FirebaseCarDatasourceImpl implements CarDatasource {
  final IRemoteStorage _storage;
  FirebaseCarDatasourceImpl(
    this._storage,
  );

  @override
  Future<AddCarResult> addCar({required CarEntity car}) async {
    try {
      return await _storage.addItem(
          map: CarMapper.toMap(car: car), collectionPath: 'cars');
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw CantAddCar();
    }
  }

  @override
  Future<GetAllCarsResult> getAllCars() async {
    try {
      final response = await _storage.getAll(collectionPath: 'cars');

      return response.map((car) => CarMapper.fromMap(car)).toList();
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw CarListNotFound();
    }
  }

  @override
  Future<GetCarByIdResult> getCarByID({required String uid}) async {
    try {
      final response = await _storage.getByID(id: uid, collectionPath: 'cars');
      if (response == null) {
        throw CarNotFound();
      }

      return CarMapper.fromMap(response);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return null;
    }
  }

  @override
  Future<UpdateCarResult> updateCar({required CarEntity car}) async {
    try {
      return await _storage.updateItem(
          map: CarMapper.toMap(car: car), collectionPath: 'cars');
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw CantUpdateCar();
    }
  }

  @override
  Future<RemoveResult> removeCar({required String uid}) async {
    try {
      return _storage.removeItem(uid: uid, collectionPath: 'cars');
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw CantRemoveCar();
    }
  }
}
