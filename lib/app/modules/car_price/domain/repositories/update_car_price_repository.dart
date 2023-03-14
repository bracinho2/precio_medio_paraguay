import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/core/errors/errors.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/entities/car_price_entitity.dart';

abstract class UpdateCarPriceRepository {
  Future<Either<Failure, Unit>> call({required CarPriceEntity carPriceEntity});
}
