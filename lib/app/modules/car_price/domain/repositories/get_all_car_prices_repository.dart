import 'package:dartz/dartz.dart';
import 'package:precio_medio_paraguay/app/modules/car_price/domain/entities/car_price_entitity.dart';

import '../../../../core/errors/errors.dart';

abstract class GetAllCarPricesRepository {
  Future<Either<Failure, List<CarPriceEntity>>> call();
}
