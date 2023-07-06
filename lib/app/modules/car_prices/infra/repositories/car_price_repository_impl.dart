import 'dart:developer';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/entities/car_price_entitity.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/core/typedef/typedef.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/domain/repositories/car_price_repository.dart';
import 'package:precio_medio_paraguay/app/modules/car_prices/infra/datasource/car_price_datasource.dart';

import '../../domain/errors/errors.dart';

class CarPriceRepositoryImpl implements CarPriceRepository {
  final CarPriceDatasource _datasource;

  CarPriceRepositoryImpl(this._datasource);
  @override
  Future<AddCarPriceResult> addPrice({required CarPriceEntity price}) async {
    try {
      return await _datasource.addPrice(price: price);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw CantRegisterPrice();
    }
  }

  @override
  Future<GetPriceResult?> getPrice({required String uid}) async {
    try {
      return await _datasource.getPrice(uid: uid);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw PriceNotFound();
    }
  }

  @override
  Future<ListCarPriceResult> getPrices() async {
    try {
      return await _datasource.getPrices();
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw PricesNotFound();
    }
  }

  @override
  Future<RemoveCarPriceResult> removePrice({required String uid}) async {
    try {
      return await _datasource.removePrice(uid: uid);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw RemovePriceError();
    }
  }

  @override
  Future<UpdateCarPriceResult> updatePrice(
      {required CarPriceEntity price}) async {
    try {
      return await _datasource.updatePrice(price: price);
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      throw UpdatePriceError();
    }
  }
}
