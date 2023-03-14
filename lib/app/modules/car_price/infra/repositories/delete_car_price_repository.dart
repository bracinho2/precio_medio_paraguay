import 'package:precio_medio_paraguay/app/core/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/errors/errors.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/repositories/delete_car_price_repository.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/infra/datasource/delete_car_price_datasource.dart';

class DeleteCarPriceRepositoryImpl implements DeleteCarPriceRepository {
  final DeleteCarPriceDatasource _deleteCarPriceDatasource;

  DeleteCarPriceRepositoryImpl(this._deleteCarPriceDatasource);
  @override
  Future<Either<Failure, Unit>> call({required String carPriceID}) async {
    try {
      await _deleteCarPriceDatasource.call(carPriceID: carPriceID);
      return const Right(unit);
    } catch (e, s) {
      return Left(
        CarPriceError(
          message: e.toString(),
          stackTrace: s,
          label: 'Delete Car Price Repository Error',
        ),
      );
    }
  }
}
