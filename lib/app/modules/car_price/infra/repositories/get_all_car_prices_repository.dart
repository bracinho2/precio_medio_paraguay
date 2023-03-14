import 'package:precio_medio_paraguay/app/modules/car_price/domain/entities/car_price_entitity.dart';
import 'package:precio_medio_paraguay/app/core/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/errors/errors.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/repositories/get_all_car_prices_repository.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/infra/datasource/get_all_car_prices_datasource.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/infra/mappers/car_price_mapper.dart';

class GetAllCarPrices implements GetAllCarPricesRepository {
  final GetAllCarPricesDatasource _getAllCarPricesDatasource;

  GetAllCarPrices(this._getAllCarPricesDatasource);
  @override
  Future<Either<Failure, List<CarPriceEntity>>> call() async {
    try {
      final result = await _getAllCarPricesDatasource.call();

      final values =
          result.map((map) => CarPriceMapper.fromMap(map: map)).toList();
      return Right(values);
    } catch (e, s) {
      return Left(
        CarPriceError(
          message: e.toString(),
          stackTrace: s,
          label: 'Get All Car Prices Repository Error',
        ),
      );
    }
  }
}
