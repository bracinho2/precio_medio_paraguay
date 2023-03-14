import 'package:precio_medio_paraguay/app/modules/car_price/domain/entities/car_price_entitity.dart';
import 'package:precio_medio_paraguay/app/core/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/repositories/add_car_price_repository.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/infra/datasource/add_car_price_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/infra/mappers/car_price_mapper.dart';

import '../../domain/errors/errors.dart';

class AddCarPriceRepositoryImpl implements AddCarPriceRepository {
  final AddCarPriceDatasource _addCarPriceDatasource;

  AddCarPriceRepositoryImpl(this._addCarPriceDatasource);
  @override
  Future<Either<Failure, Unit>> call(
      {required CarPriceEntity carPriceEntity}) async {
    try {
      final value = CarPriceMapper.toMap(carPrice: carPriceEntity);
      await _addCarPriceDatasource.call(carPrice: value);
      return const Right(unit);
    } catch (e, s) {
      return Left(
        CarPriceError(
          message: e.toString(),
          stackTrace: s,
          label: 'Add Car Price Register Reposity Error',
        ),
      );
    }
  }
}
