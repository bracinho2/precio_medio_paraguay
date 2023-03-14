import 'package:precio_medio_paraguay/app/modules/car_price/domain/entities/car_price_entitity.dart';

import 'package:precio_medio_paraguay/app/core/errors/errors.dart';

import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/errors/errors.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/infra/datasource/update_car_price_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/infra/mappers/car_price_mapper.dart';

import '../../domain/repositories/update_car_price_repository.dart';

class UpdateCarPriceRepositoryImpl implements UpdateCarPriceRepository {
  final UpdateCarPriceDatasource _updateCarPriceDatasource;

  UpdateCarPriceRepositoryImpl(this._updateCarPriceDatasource);
  @override
  Future<Either<Failure, Unit>> call(
      {required CarPriceEntity carPriceEntity}) async {
    try {
      final value = CarPriceMapper.toMap(carPrice: carPriceEntity);
      await _updateCarPriceDatasource.call(carPriceEntity: value);
      return const Right(unit);
    } catch (e, s) {
      return Left(
        CarPriceError(
          message: e.toString(),
          stackTrace: s,
          label: 'Update Car Price Repository Error',
        ),
      );
    }
  }
}
