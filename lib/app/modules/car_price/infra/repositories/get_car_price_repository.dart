import 'package:precio_medio_paraguay/app/modules/car_price/domain/entities/car_price_entitity.dart';
import 'package:precio_medio_paraguay/app/core/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/errors/errors.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/repositories/get_car_price_repository.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/infra/datasource/get_car_price_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/infra/mappers/car_price_mapper.dart';

class GetCarPriceRepositoryImpl implements GetCarPriceRepository {
  final GetCarPriceDatasource _getCarPriceDatasource;

  GetCarPriceRepositoryImpl(this._getCarPriceDatasource);
  @override
  Future<Either<Failure, CarPriceEntity>> call(
      {required String carPriceID}) async {
    try {
      final result = await _getCarPriceDatasource.call(carPriceID: carPriceID);
      final carPrice = CarPriceMapper.fromMap(map: result);
      return Right(carPrice);
    } catch (e, s) {
      return Left(
        CarPriceError(
          message: e.toString(),
          stackTrace: s,
          label: 'Get Car Price Repository Error',
        ),
      );
    }
  }
}
