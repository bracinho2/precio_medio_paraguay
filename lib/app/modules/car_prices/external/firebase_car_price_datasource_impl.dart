import 'dart:developer';

import 'package:precio_medio_paraguay/app/core/services/firestore/remote_storage_service_interface.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/entities/car_price_entitity.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/core/typedef/typedef.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/infra/datasource/car_price_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/external/mappers/car_price_mapper.dart';

import '../domain/errors/errors.dart';

class CarPriceDatasourceImpl implements CarPriceDatasource {
  final IRemoteStorage _storage;

  CarPriceDatasourceImpl(this._storage);
  @override
  Future<AddCarPriceResult> addPrice({required CarPriceEntity price}) async {
    try {
      return await _storage.addItem(
          map: CarPriceMapper.toMap(price: price),
          collectionPath: 'car_prices');
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw CarPriceStorageError();
    }
  }

  @override
  Future<GetPriceResult> getPrice({required String uid}) async {
    try {
      final response =
          await _storage.getByID(id: uid, collectionPath: 'car_prices');

      if (response == null) {
        throw CarPriceNotFound();
      }
      return CarPriceMapper.fromMap(map: response);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return null;
    }
  }

  @override
  Future<ListCarPriceResult> getPrices() async {
    try {
      final response = await _storage.getAll(collectionPath: 'car_prices');

      final values =
          response.map((map) => CarPriceMapper.fromMap(map: map)).toList();
      return values;
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw ListCarPriceNotFound();
    }
  }

  @override
  Future<RemoveCarPriceResult> removePrice({required String uid}) async {
    try {
      return await _storage.removeItem(uid: uid, collectionPath: 'car_prices');
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw CantRemovePrice();
    }
  }

  @override
  Future<UpdateCarPriceResult> updatePrice(
      {required CarPriceEntity price}) async {
    try {
      return await _storage.updateItem(
          map: CarPriceMapper.toMap(price: price),
          collectionPath: 'car_prices');
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw CantUpdatePrice();
    }
  }
}
