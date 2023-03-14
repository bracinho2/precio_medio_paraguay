import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/core/errors/errors.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/entities/car_price_entitity.dart';

abstract class GetCarPriceRepository {
  Future<Either<Failure, CarPriceEntity>> call({required String carPriceID});
}
